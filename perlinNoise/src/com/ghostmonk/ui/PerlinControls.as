package com.ghostmonk.ui {
	
	import com.ghostmonk.events.MeasureEvent;
	import com.ghostmonk.events.PointValueEvent;
	import com.ghostmonk.events.ToggleEvent;
	import com.ghostmonk.organic.BasicPerlinData;
	import com.ghostmonk.organic.PerlinValues;
	import com.ghostmonk.startupdata.PerlinNoiseData;
	import com.ghostmonk.ui.composed.SimpleSlider;
	import com.ghostmonk.ui.composed.SimpleStepper;
	import com.ghostmonk.ui.composed.Switch;
	import com.ghostmonk.ui.composed.TwoDimensionalGridControl;
	
	/**
	 * 
	 * @author ghostmonk 19/04/2009
	 * 
	 */
	public class PerlinControls extends PerlinPanelAsset {
		
		private var _perlinRandomSeed:SimpleSlider;
		private var _perlinBase:TwoDimensionalGridControl;	
		private var _perlinFractalNoise:Switch;
		private var _perlinGreyScale:Switch;
		private var _perlinStitch:Switch;
		private var _channel:SimpleStepper;
		private var _speed:SimpleStepper;
		
		private var _perlinValues:PerlinValues;
		private var _perlinData:BasicPerlinData;
		
		
		/**
		 * 
		 * @param perlinNoiseData
		 * 
		 */
		public function PerlinControls( startupData:PerlinNoiseData, uiFactory:UIFactory, perlinData:BasicPerlinData ) {
			
			_perlinData = perlinData;
			_perlinValues = perlinData.perlinValues;
			
			_perlinRandomSeed = uiFactory.createSimpleSlider( 
				randomSeed, 
				startupData.perlinRandomSeed, 
				onRandomSeed 
			);
			
			_perlinBase = uiFactory.create2DGridControl( 
				base, 
				startupData.perlinBase.xstart, 
				startupData.perlinBase.ystart, 
				onBaseChange 
			);
			
			_perlinFractalNoise = uiFactory.createSwitch( 
				fractalNoise, 
				startupData.fractalNoise, 
				onFractalToggle 
			);
			
			_perlinGreyScale = uiFactory.createSwitch( 
				greyScale, 
				startupData.greyScale, 
				onGreyScaleToggle 
			);
			
			_perlinStitch = uiFactory.createSwitch( 
				stitch, 
				startupData.stitch, 
				onStitchToggle 
			);
			
			_channel = uiFactory.createStepper( 
				channel, 
				startupData.perlinChannel,
				onChannelChange
			); 
			
			_speed = uiFactory.createStepper(
				speed,
				startupData.speed,
				onSpeedChange
			)
			
		}
		
		
		
		private function onRandomSeed( e:MeasureEvent ):void {
			
			_perlinValues.randomSeed = e.value;
			
		}
		
		
		private function onFractalToggle( e:ToggleEvent ):void {
			
			_perlinValues.fractalNoise = e.isTrue;
			
		}
		
		
		
		private function onGreyScaleToggle( e:ToggleEvent ):void {
			
			_perlinValues.greyScale = e.isTrue;
			
		}
		
		
		
		private function onStitchToggle( e:ToggleEvent ):void {
			
			_perlinValues.stitch = e.isTrue;
			
		}
		
		
		private function onBaseChange( e:PointValueEvent ):void {
			
			var maxBaseX:Number = _perlinData.bitmapData.width;
			var maxBaseY:Number = _perlinData.bitmapData.height;
			var minbaseX:Number = _perlinData.bitmapData.width / 5;
			var minbaseY:Number = _perlinData.bitmapData.height / 5;
			_perlinValues.baseX = ( maxBaseX - minbaseX ) * e.point.x + minbaseX;
			_perlinValues.baseY = ( maxBaseY - minbaseY ) * e.point.y + minbaseY;
			
		}
		
		private function onChannelChange( e:MeasureEvent ):void {
			
			_perlinValues.channelOptions = e.value;
			
		}
		
		
		private function onSpeedChange( e:MeasureEvent ):void {
			
			_perlinData.changeSpeed( e.value );
			
		}

	}
}