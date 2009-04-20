package com.ghostmonk.ui {
	
	import com.ghostmonk.events.MeasureEvent;
	import com.ghostmonk.events.ToggleEvent;
	import com.ghostmonk.startupdata.ParticleData;
	import com.ghostmonk.ui.composed.SimpleSlider;
	import com.ghostmonk.ui.composed.Switch;
	
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
		
		
		/**
		 * 
		 * @param particleData
		 * 
		 */
		public function ParticleControls( startupData:ParticleData, uiFactory:UIFactory ) {
			
			_number = uiFactory.createSimpleSlider( particleNumber, startupData.particleAmount, onParticleChange );
			_alpha = uiFactory.createSimpleSlider( controlsAlpha, startupData.controlsAlpha, onAlphaControls );
			_togglePerlin = uiFactory.createSwitch( togglePerlin, startupData.showPerlin, onPerlinToggle );
			_toggleParticles = uiFactory.createSwitch( toggleParticles, startupData.showParticles, onParticlesToggle );
			
		}
		
		
		
		private function onParticleChange( e:MeasureEvent ):void {
		
		
			
		}
		
		
		
		private function onPerlinResolution( e:MeasureEvent ):void {
			
			
			
		}
		
		
		
		private function onAlphaControls( e:MeasureEvent ):void {
			
			
			
		}
		
		
		
		private function onPerlinToggle( e:ToggleEvent ):void {
			
			
			
		}
		
		
		
		private function onParticlesToggle( e:ToggleEvent ):void {
			
			
			
		}

	}
}