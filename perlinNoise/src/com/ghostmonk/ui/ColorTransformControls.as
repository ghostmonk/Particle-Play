package com.ghostmonk.ui {
	
	import com.ghostmonk.events.MeasureEvent;
	import com.ghostmonk.startupdata.ColorTransformData;
	import com.ghostmonk.ui.composed.SimpleSlider;
	
	import flash.geom.ColorTransform;
	
	/**
	 * 
	 * @author ghostmonk 19/04/2009
	 * 
	 */
	public class ColorTransformControls extends ColorPanelAsset {
		
		private var _redMultiplier:SimpleSlider;
		private var _redOffset:SimpleSlider;
		private var _blueMultiplier:SimpleSlider;
		private var _blueOffset:SimpleSlider;
		private var _greenMultiplier:SimpleSlider;
		private var _greenOffset:SimpleSlider;
		private var _alphaMultiplier:SimpleSlider;
		private var _alphaOffset:SimpleSlider;	
		
		private var _colorTransform:ColorTransform;
		
		/**
		 * 
		 * @param ctData
		 * 
		 */
		public function ColorTransformControls( startupData:ColorTransformData, uiFactory:UIFactory, colorTransform:ColorTransform ) {
			
			_colorTransform = colorTransform;
			
			_redMultiplier = uiFactory.createSimpleSlider( redMultiplier, startupData.multiplier, onMultiply );
			_redOffset = uiFactory.createSimpleSlider( redOffset, startupData.offset, onOffset );
			
			_greenMultiplier = uiFactory.createSimpleSlider( greenMultiplier, startupData.multiplier, onMultiply );
			_greenOffset = uiFactory.createSimpleSlider( greenOffset, startupData.offset, onOffset );
			
			_blueMultiplier = uiFactory.createSimpleSlider( blueMultiplier, startupData.multiplier, onMultiply );
			_blueOffset = uiFactory.createSimpleSlider( blueOffset, startupData.offset, onOffset );
			
			_alphaMultiplier = uiFactory.createSimpleSlider( alphaMultiplier, startupData.multiplier, onMultiply );
			_alphaOffset = uiFactory.createSimpleSlider( alphaOffset, startupData.offset, onOffset );
			
		}
		
		
		
		private function onMultiply( e:MeasureEvent ):void {
			
			switch( e.target ) {
				
				case _redMultiplier:
					_colorTransform.redMultiplier = e.value;
					break;
					
				case _greenMultiplier:
					_colorTransform.greenMultiplier = e.value;
					break;
					
				case _blueMultiplier:
					_colorTransform.blueMultiplier = e.value;
					break;
					
				case _alphaMultiplier:
					_colorTransform.alphaMultiplier = e.value;
					break;
					
				default:
					trace("This trace statment should never be seen in the onMultiply method in ColorTransformControls");
				
			}
			
		}
		
		
		
		private function onOffset( e:MeasureEvent ):void {
			
			switch( e.target ) {
				
				case _redOffset:
					_colorTransform.redOffset = e.value;
					break;
					
				case _greenOffset:
					_colorTransform.greenOffset = e.value;
					break;
					
				case _blueOffset:
					_colorTransform.blueOffset = e.value;
					break;
					
				case _alphaOffset:
					_colorTransform.alphaOffset = e.value;
					break;
					
				default:
					trace("This trace statment should never be seen in the onOffset method in ColorTransformControls");
				
			}
			
		}
		
		

	}
}