package com.ghostmonk.ui {
	
	import com.ghostmonk.display.ParticleOutput;
	import com.ghostmonk.events.MeasureEvent;
	import com.ghostmonk.events.PointValueEvent;
	import com.ghostmonk.events.ToggleEvent;
	import com.ghostmonk.startupdata.GlowFilterData;
	import com.ghostmonk.ui.composed.SimpleSlider;
	import com.ghostmonk.ui.composed.SimpleStepper;
	import com.ghostmonk.ui.composed.Switch;
	import com.ghostmonk.ui.composed.TwoDimensionalGridControl;
	
	import flash.filters.BlurFilter;
	import flash.filters.GlowFilter;
	
	/**
	 * 
	 * @author ghostmonk 25/04/2009
	 * 
	 */
	public class GlowFilterControls extends GlowFilterPanel {
		
		private var _glowReveal:Switch;
		private var _glowAlpha:SimpleSlider;
		private var _glowBlur:TwoDimensionalGridControl;
		private var _strength:SimpleStepper;
		private var _quality:SimpleStepper;
		
		private var _glowFilter:GlowFilter;
		
		private var _blurMax:Number;
		private var _blurMin:Number;
		
		private var _particleOutput:ParticleOutput;
		
		
		/**
		 * 
		 * @param glowData
		 * 
		 */
		public function GlowFilterControls( startupData:GlowFilterData, uiFactory:UIFactory, particleOutput:ParticleOutput ) {
			
			_particleOutput = particleOutput;
			
			_blurMax = startupData.glowBlur.max;
			_blurMin = startupData.glowBlur.min;
			
			_glowFilter = new GlowFilter( 
				startupData.color, 
				startupData.alpha.start, 
				startupData.glowBlur.xstart * _blurMax, 
				startupData.glowBlur.ystart * _blurMax, 
				startupData.glowStrength.start,
				startupData.glowStrength.start
			);
			
			if( startupData.glowToggle ) {
				onFilterToggle( null );
			}
			
			_glowReveal = uiFactory.createSwitch( 
				toggle, 
				startupData.glowToggle, 
				onFilterToggle 
			);
			
			_glowAlpha = uiFactory.createSimpleSlider( 
				glowAlpha, 
				startupData.alpha, 
				onAlphaChange 
			);
			
			_glowBlur = uiFactory.create2DGridControl( 
				blur,
				startupData.glowBlur.xstart,
				startupData.glowBlur.ystart,
				onFilterBlur
			);
			
			_strength = uiFactory.createStepper(
				strength,
				startupData.glowStrength,
				onStrengthChange
			);
			
			_quality = uiFactory.createStepper(
				quality,
				startupData.glowQuality,
				onQualityChange
			);
			
		}
		
		
		
		private function onFilterToggle( e:ToggleEvent ):void {
			
			if( _particleOutput.filters.length < 1 ) {
				setFilters();	
			}
			else {
				_particleOutput.filters = [];
			}
			
		}
		
		
		
		private function onAlphaChange( e:MeasureEvent ):void {
			
			_glowFilter.alpha = e.value;
			setFilters();
			
		}
		
		
		private function onFilterBlur( e:PointValueEvent ):void {
			
			_glowFilter.blurX = e.point.x * _blurMax;
			_glowFilter.blurY = e.point.y * _blurMax;
			setFilters();
			
		}
		
		
		
		private function onStrengthChange( e:MeasureEvent ):void {
			
			_glowFilter.strength = e.value;
			setFilters();		
			
		}
		
		
		
		private function onQualityChange( e:MeasureEvent ):void {
			
			_glowFilter.quality = e.value;
			setFilters();		
			
		}
		
		
		
		private function setFilters():void {
			
			_particleOutput.filters = [ _glowFilter, new BlurFilter( 0, 4, 1) ];
			
		}
		
		
		
	}
}