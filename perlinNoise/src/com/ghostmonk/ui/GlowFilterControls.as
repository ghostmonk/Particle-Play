package com.ghostmonk.ui {
	
	import com.ghostmonk.display.ParticleOutput;
	import com.ghostmonk.events.MeasureEvent;
	import com.ghostmonk.events.ToggleEvent;
	import com.ghostmonk.startupdata.GlowFilterData;
	import com.ghostmonk.ui.composed.SimpleSlider;
	import com.ghostmonk.ui.composed.Switch;
	import com.ghostmonk.ui.composed.TwoDimensionalGridControl;
	
	public class GlowFilterControls extends GlowFilterPanel {
		
		private var _glowReveal:Switch;
		private var _glowAlpha:SimpleSlider;
		private var _glowBlur:TwoDimensionalGridControl;
		
		private var _particleOutput:ParticleOutput;
		
		
		/**
		 * 
		 * @param glowData
		 * 
		 */
		public function GlowFilterControls( startupData:GlowFilterData, uiFactory:UIFactory, particleOutput:ParticleOutput ) {
			
			_particleOutput = particleOutput;
			
			_glowReveal = uiFactory.createSwitch( toggle, startupData.glowToggle, onFilterToggle );
			_glowAlpha = uiFactory.createSimpleSlider( glowAlpha, startupData.alpha, onAlphaChange );
			_glowBlur = new TwoDimensionalGridControl( blur, blur.getChildByName( "marker") );
			
		}
		
		
		
		private function onFilterToggle( e:ToggleEvent ):void {
			
			
			
		}
		
		
		
		private function onAlphaChange( e:MeasureEvent ):void {
			
			
			
		}
		
		
		
	}
}