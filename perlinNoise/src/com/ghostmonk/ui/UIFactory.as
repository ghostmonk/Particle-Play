package com.ghostmonk.ui {
	
	import com.ghostmonk.events.MeasureEvent;
	import com.ghostmonk.events.PointValueEvent;
	import com.ghostmonk.events.ToggleEvent;
	import com.ghostmonk.ui.composed.SimpleSlider;
	import com.ghostmonk.ui.composed.SimpleStepper;
	import com.ghostmonk.ui.composed.Switch;
	import com.ghostmonk.ui.composed.TwoDimensionalGridControl;
	
	import flash.display.Sprite;
	import flash.text.TextField;
	
	/**
	 * 
	 * @author ghostmonk 19/04/2009
	 * 
	 */
	public class UIFactory {
		
		
		
		/**
		 * 
		 * 
		 */
		public function UIFactory( ) {
		
		}
		
		
		/**
		 * 
		 * @param holder
		 * @param values
		 * @param callBack
		 * @return 
		 * 
		 */
		public function createSimpleSlider( holder:Sprite, values:Object, callBack:Function ):SimpleSlider {
			
			var slider:SimpleSlider =  new SimpleSlider ( 
				holder,
				holder.getChildByName( "hitarea" ),
				holder.getChildByName( "marker" ),
				values.min,
				values.max
			);
			
			slider.currentValue = values.start;
			values = null;
			
			slider.addEventListener( MeasureEvent.VALUE_CHANGE, callBack );
			
			return slider;
			
		}
		
		
		
		/**
		 * 
		 * @param holder
		 * @param isOn
		 * @param callback
		 * @return 
		 * 
		 */
		public function createSwitch( holder:Sprite, isOn:Boolean, callback:Function ):Switch {
			
			var switcher:Switch = new Switch( holder, holder.getChildByName( "marker" ), isOn );
			
			switcher.addEventListener( ToggleEvent.TOGGLE, callback );
			 
			return switcher;
			
		}
		
		
		
		/**
		 * 
		 * @param holder
		 * @param xValue
		 * @param yValue
		 * @param callback
		 * @return 
		 * 
		 */
		public function create2DGridControl( holder:Sprite, xValue:Number, yValue:Number, callback:Function ):TwoDimensionalGridControl {
			
			var gridControl:TwoDimensionalGridControl = 
				new TwoDimensionalGridControl( 
					holder, 
					holder.getChildByName( "marker" ), 
					xValue, 
					yValue 
				);
			
			gridControl.addEventListener( PointValueEvent.POINT_PERCENT, callback );
			
			return gridControl;
			
		}
		
		
		
		/**
		 * 
		 * @param holder
		 * @param min
		 * @param max
		 * @param start
		 * @param callback
		 * @return 
		 * 
		 */
		public function createStepper( holder:Sprite, values:Object, callback:Function ):SimpleStepper {
			
			var stepper:SimpleStepper 
				= new SimpleStepper(
					holder,
					holder.getChildByName( "stepUp" ) as Sprite,
					holder.getChildByName( "stepDown" ) as Sprite,
					holder.getChildByName( "output" ) as TextField,
					values.max,
					values.min,
					values.start,
					values.increment || 1
					)
			
			stepper.addEventListener( MeasureEvent.VALUE_CHANGE, callback );
				
			return stepper;
			
		}
		
		
		
	}
}