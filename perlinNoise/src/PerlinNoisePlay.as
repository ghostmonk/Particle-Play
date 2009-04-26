package {
	
	import com.ghostmonk.display.ParticleOutput;
	import com.ghostmonk.events.ExtendedToggleEvent;
	import com.ghostmonk.events.MeasureEvent;
	import com.ghostmonk.events.ToggleEvent;
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
	
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.geom.ColorTransform;
	import flash.geom.Rectangle;
	
	[ SWF ( width=470, height=470, frameRate=31, backgroundColor=0x000000 ) ]
	
	public class PerlinNoisePlay extends Sprite {
		
		private const PARTICLE_COLOR:uint = 0xFFFFFFFF;
		private const RECTANGLE:Rectangle = new Rectangle( 0, 0, stage.stageWidth, stage.stageHeight );
		
		private var _systemPanel:SystemControlPanel;
		
		private var _colorTransform:ColorTransform;
		
		private var _perlinData:BasicPerlinData;
		private var _dataScale:Number;
		
		private var _particleOutput:ParticleOutput;
		private var _renderParticles:Boolean;
		
		
		public function PerlinNoisePlay() {
			
			stage.scaleMode = StageScaleMode.NO_SCALE;
			_dataScale = stage.stageWidth / 100; 
			
			_perlinData = new BasicPerlinData( new PerlinValues(), 100, 100, _dataScale, 2 ); 
			_colorTransform = new ColorTransform( 1, 1, 1, 0.9 );
			_particleOutput = new ParticleOutput( new BitmapData( stage.stageWidth, stage.stageHeight, true, 0x00000000 ) );
			
			var uiFactory:UIFactory = new UIFactory( );
			
			_systemPanel = new SystemControlPanel(
				new ColorTransformControls( new ColorTransformData(), uiFactory, _colorTransform ),
				new GlowFilterControls( new GlowFilterData(), uiFactory, _particleOutput ),
				new ParticleControls( new ParticleData(), uiFactory, _particleOutput ),
				new PerlinControls( new PerlinNoiseData(), uiFactory, _perlinData )
			);
			
			_systemPanel.addEventListener( ToggleEvent.TOGGLE, onPerlinToggle );
			_systemPanel.addEventListener( ExtendedToggleEvent.TOGGLE_PARTICLES, onToggleParticles );
			
			addChild( _perlinData );
			addChild( _particleOutput );
			addChild( _systemPanel );
			
			addEventListener( Event.ENTER_FRAME, onEnterFrame );
		}
		
		
		private function onEnterFrame( e:Event ):void {
			
			_particleOutput.bitmapData.colorTransform( RECTANGLE, _colorTransform );
			
			if( _renderParticles ) {
				_particleOutput.perlinParticleMovement( _perlinData, _dataScale );
			}
			
			_perlinData.renderData();
			
		}
		
		
		private function onPerlinToggle( e:ToggleEvent ):void {
			
			_perlinData.toggleDisplay( e.isTrue );
			
		}
		
		
		private function onToggleParticles( e:ExtendedToggleEvent ):void {
			
			_renderParticles = e.isTrue;
			
		}
		
	
	}
}
