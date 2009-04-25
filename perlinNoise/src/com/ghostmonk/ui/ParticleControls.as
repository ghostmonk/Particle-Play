package com.ghostmonk.ui {
	
	import com.ghostmonk.display.ParticleOutput;
	import com.ghostmonk.events.ExtendedToggleEvent;
	import com.ghostmonk.events.MeasureEvent;
	import com.ghostmonk.events.ToggleEvent;
	import com.ghostmonk.startupdata.ParticleData;
	import com.ghostmonk.ui.composed.SimpleSlider;
	import com.ghostmonk.ui.composed.Switch;
	
	import flash.events.Event;
	
	[ Event ( name="toggle", type="com.ghostmonk.events.ToggleEvent" ) ]
	[ Event ( name="toggleParticles", type="com.ghostmonk.events.ExtendedToggleEvent" ) ]
	
	/**
	 * 
	 * @author ghostmonk 19/04/2009
	 * 
	 */
	public class ParticleControls extends ParticlePanelAsset {
		
		private var _number:SimpleSlider;
		private var _alpha:SimpleSlider;
		private var _togglePerlin:Switch;
		private var _toggleParticles:Switch;
		private var _particleOutput:ParticleOutput;
		
		private var _showParticles:Boolean;
		private var _showPerlin:Boolean;
		private var _startupData:ParticleData;
		
		/**
		 * 
		 * @param particleData
		 * 
		 */
		public function ParticleControls( startupData:ParticleData, uiFactory:UIFactory, particleOutput:ParticleOutput ) {
			
			_startupData = startupData;
			_showPerlin = startupData.showPerlin;
			
			_number = uiFactory.createSimpleSlider( particleNumber, startupData.particleAmount, onParticleChange );
			_alpha = uiFactory.createSimpleSlider( controlsAlpha, startupData.controlsAlpha, onAlphaControls );
			_togglePerlin = uiFactory.createSwitch( togglePerlin, _showPerlin, onPerlinToggle );
			_toggleParticles = uiFactory.createSwitch( toggleParticles, startupData.showParticles, onParticlesToggle );
			
			_particleOutput = particleOutput;
			
			_particleOutput.addEventListener( Event.ADDED_TO_STAGE, onAddedToStage );
			
			_particleOutput.visibleParticles = startupData.particleAmount.start;
			
		}
		
		
		
		private function onAddedToStage( e:Event ):void {
			
			_particleOutput.removeEventListener( Event.ADDED_TO_STAGE, onAddedToStage );
			
			_particleOutput.createParticles( 
				_startupData.particleAmount.max, 
				_startupData.particleSpeed.min, 
				_startupData.particleSpeed.max, 
				_startupData.particleColor
			);
			
			dispatchEvent( new ToggleEvent( ToggleEvent.TOGGLE, _startupData.showPerlin ) );
			dispatchEvent( new ExtendedToggleEvent( ExtendedToggleEvent.TOGGLE_PARTICLES, _startupData.showParticles ) );
			
			_startupData = null;
			
		}
		
		
		
		private function onParticleChange( e:MeasureEvent ):void {
		
			_particleOutput.visibleParticles = int( e.value );
			
		}
		
		
		
		private function onPerlinResolution( e:MeasureEvent ):void {
			
			
			
		}
		
		
		
		private function onAlphaControls( e:MeasureEvent ):void {
			
			
			
		}
		
		
		
		private function onPerlinToggle( e:ToggleEvent ):void {
			
			dispatchEvent( e );
			
		}
		
		
		
		private function onParticlesToggle( e:ToggleEvent ):void {
			
			dispatchEvent( new ExtendedToggleEvent( ExtendedToggleEvent.TOGGLE_PARTICLES, e.isTrue ) );
			
		}

	}
}