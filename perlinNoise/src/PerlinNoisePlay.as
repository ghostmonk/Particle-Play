package {
	
	import com.ghostmonk.organic.BasicPerlinData;
	import com.ghostmonk.organic.PerlinValues;
	import com.ghostmonk.startupdata.ColorTransformData;
	import com.ghostmonk.startupdata.GlowFilterData;
	import com.ghostmonk.startupdata.ParticleData;
	import com.ghostmonk.startupdata.PerlinNoiseData;
	import com.ghostmonk.ui.ColorTransformControls;
	import com.ghostmonk.ui.GlowFilterControls;
	import com.ghostmonk.ui.ParticleControls;
	import com.ghostmonk.ui.PerlinControls;
	import com.ghostmonk.ui.SystemControlPanel;
	import com.ghostmonk.ui.UIFactory;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.ColorTransform;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	[ SWF ( width=600, height=600, frameRate=100, backgroundColor=0x000000 ) ]
	
	public class PerlinNoisePlay extends Sprite {
		
		private const MIN_SPEED:int = 1;
		private const SPEED_VARIANCE:int = 5;
		private const PARTICLE_COLOR:uint = 0xFFFFFFFF;
		private const RECTANGLE:Rectangle = new Rectangle( 0, 0, stage.stageWidth, stage.stageHeight );
		
		private var _systemPanel:SystemControlPanel;
		
		private var _visibleParticles:int;
		private var _colorTransform:ColorTransform;
		
		private var _perlinData:BasicPerlinData;
		private var _particles:Array;
		private var _speeds:Array;
		private var _dataScale:Number;
		
		private var _particleOutput:Bitmap;
		
		
		public function PerlinNoisePlay() {
			
			stage.scaleMode = StageScaleMode.NO_SCALE;
			_dataScale = stage.stageWidth / 100; 
			
			_perlinData = new BasicPerlinData( new PerlinValues(), 100, 100, _dataScale, 2 ); 
			_colorTransform = new ColorTransform( );
			_particleOutput = new Bitmap( new BitmapData( stage.stageWidth, stage.stageHeight, true, 0x00000000 ) );
			
			var uiFactory:UIFactory = new UIFactory( );
			
			_systemPanel = new SystemControlPanel(
				new ColorTransformControls( new ColorTransformData(), uiFactory, _colorTransform ),
				new GlowFilterControls( new GlowFilterData(), uiFactory, _particleOutput ),
				new ParticleControls( new ParticleData(), uiFactory ),
				new PerlinControls( new PerlinNoiseData(), uiFactory, _perlinData )
			);
			
			_particles = new Array();
			_speeds = new Array();
			
			
			addChild( _perlinData );
			addChild( _particleOutput );
			addChild( _systemPanel );
			
			createPoints();
			
		}
		
		
		
		private function createPoints():void {
			
			for( var i:int = 0; i < _visibleParticles; i++ ) {
				
				var particle:Point =  new Point();
				particle.x = stage.stageWidth / _visibleParticles * i;
				particle.y = 0;
				
				_particles.push( particle );
				_speeds.push( Math.random() * SPEED_VARIANCE + MIN_SPEED );
				
			}
			
			addEventListener( Event.ENTER_FRAME, onEnterFrame );
			
		}
				
		
		
		private function onEnterFrame( e:Event ):void {
			
			_particleOutput.bitmapData.colorTransform( RECTANGLE, _colorTransform );
			
			for( var i:int = 0; i < _visibleParticles; i++ ) {
				
				var particle:Point = _particles[ i ];
				
				if( particle.x > stage.stageWidth ) {
					
					particle.x = 2;
					
				}
				else if( particle.x < 0 ) {
					
					particle.x = stage.stageWidth - 2;
					
				}
				else if( particle.y >= stage.stageHeight ) {
					
					particle.y = 0;
					
				}
				else if( particle.y < 0) {
					
					particle.y = stage.stageHeight - 1;
					
				}
				
				var rads:Number = _perlinData.getDataPoint( particle.x / _dataScale, particle.y / _dataScale) * 2 * Math.PI;
				var speed:Number = _speeds[ i ];
				
				particle.x += Math.cos( rads ) * speed;
				particle.y += Math.sin( rads ) * speed;
				
				_particleOutput.bitmapData.setPixel32( particle.x, particle.y, PARTICLE_COLOR );  
				
			}
			
			
			_perlinData.renderData();
			
		}
		
	
	}
}
