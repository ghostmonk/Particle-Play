package {
	
	import com.ghostmonk.data.ControlsStartupData;
	import com.ghostmonk.organic.BasicPerlinData;
	import com.ghostmonk.organic.PerlinValues;
	import com.ghostmonk.ui.SystemControlPanel;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.filters.BlurFilter;
	import flash.filters.GlowFilter;
	import flash.geom.ColorTransform;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import net.hires.debug.Stats;
	
	[ SWF ( width=600, height=600, frameRate=100, backgroundColor=0x000000 ) ]
	
	public class PerlinNoisePlay extends Sprite {
		
		private const CONTROLS_ALPHA:Number = 0.7;
		private const MIN_SPEED:int = 1;
		private const SPEED_VARIANCE:int = 10;
		private const TOTAL:int = 7000;
		private const PARTICLE_COLOR:uint = 0xFFFFFFFF;
		private const PARTICLE_SIZE:uint = 1;
		private const BITMAP_SIZE:uint = 400;
		private const PERLIN_OFFSET:Number = 2;
		private const COLOR_TRANSFORM:ColorTransform = new ColorTransform( 1, 1, 1, 0.9, 255, 0, 100 );
		private const RECTANGLE:Rectangle = new Rectangle( 0, 0, stage.stageWidth, stage.stageHeight );
		
		private var _perlinValues:PerlinValues;
		private var _perlinData:BasicPerlinData;
		private var _particles:Array;
		private var _speeds:Array;
		private var _dataScale:Number;
		private var _controlPanel:SystemControlPanel;
		
		private var _particleOutput:Bitmap;
		
		
		
		public function PerlinNoisePlay() {
			
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			_perlinValues = new PerlinValues( 50, 50, 3, 7, true, false, 3, false );
			_perlinData = new BasicPerlinData( _perlinValues, BITMAP_SIZE, BITMAP_SIZE, _dataScale, PERLIN_OFFSET );
			_perlinData.displayData();
			_particles = new Array();
			_speeds = new Array();
			_dataScale = stage.stageWidth/BITMAP_SIZE;
			_controlPanel = new SystemControlPanel( CONTROLS_ALPHA, new ControlsStartupData() );
			
			_particleOutput = new Bitmap( new BitmapData( stage.stageWidth, stage.stageHeight, true, 0x00000000 ) );
			_particleOutput.filters = [ new GlowFilter( 0x00FF00, 1, 10, 10, 5, 5 ), new BlurFilter( 0, 4, 2 ) ];
			
			addChild( _perlinData );
			addChild( _particleOutput );
			addChild( new Stats() );
			
			addChild( _controlPanel );
			
			createPoints();
			
		}
		
		
		
		private function createPoints():void {
			
			for( var i:int = 0; i < TOTAL; i++ ) {
				
				var particle:Point =  new Point();
				particle.x = stage.stageWidth / TOTAL * i;
				particle.y = 0;
				
				_particles.push( particle );
				_speeds.push( Math.random() * SPEED_VARIANCE + MIN_SPEED );
				
			}
			
			addEventListener( Event.ENTER_FRAME, onEnterFrame );
			
		}
				
		
		
		private function onEnterFrame( e:Event ):void {
			
			_particleOutput.bitmapData.colorTransform( RECTANGLE, COLOR_TRANSFORM );
			
			for( var i:int = 0; i < TOTAL; i++ ) {
				
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
