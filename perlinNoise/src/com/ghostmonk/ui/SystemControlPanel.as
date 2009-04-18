package com.ghostmonk.ui {
	
	import caurina.transitions.Tweener;
	
	import com.ghostmonk.data.ControlsStartupData;
	import com.ghostmonk.events.MeasureEvent;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	 * A collection of user interface controls to change the output of a particle system
	 * 
	 * @author ghostmonk
	 * 
	 */
	public class SystemControlPanel extends ControlPanelAsset {
		
		private var _particleNumber:SimpleSlider;
		private var _perlinResolution:SimpleSlider;
		private var _perlinOffset:SimpleSlider;
		
		/**
		 * 
		 * @param controlsAlpha
		 * @param startupData
		 * 
		 */
		public function SystemControlPanel( controlsAlpha:Number, startupData:ControlsStartupData ) {
			
			panelToggle.stop();
			
			_particleNumber = createSimpleSlider( particleNumber, startupData.particleAmount );
			_perlinResolution = createSimpleSlider( perlinResolution, startupData.perlinResolution );
			_perlinOffset = createSimpleSlider( perlinOffset, startupData.perlinOffset );
			
			addEventListener( Event.ADDED_TO_STAGE, onAddedToStage );
			addEventListener( MouseEvent.ROLL_OVER, onRollOver );
			addEventListener( MouseEvent.ROLL_OUT, onRollOut );
			
			panelToggle.alpha =
			fractalNoise.alpha = 
			greyScale.alpha = 
			particleNumber.alpha = 
			perlinResolution.alpha = 
			perlinOffset.alpha = 
			perlinBase.alpha = 
			showParticles.alpha = 
			showPerlin.alpha =  
			stitch.alpha = controlsAlpha;
			
			startupData = null;
			
		}
		
		
		
		private function onAddedToStage(e:Event = null):void {
			
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			y = stage.stageHeight - panelToggle.height;
			
		}
		
		
		
		private function onRollOut( e:MouseEvent ):void {
			
			Tweener.addTween( this, { y:stage.stageHeight - panelToggle.height, time:0.3 } );
			
		}
		
		
		
		private function onRollOver( e:MouseEvent ):void {
			
			Tweener.addTween( this, { y:stage.stageHeight - this.height, time:0.3 } );
			
		}
		
		
		
		private function createSimpleSlider( holder:Sprite, values:Object ):SimpleSlider {
			
			var slider:SimpleSlider =  new SimpleSlider( 
				holder,
				holder.getChildByName( "hitarea" ),
				holder.getChildByName( "marker" ),
				values.min,
				values.max
			);
			
			slider.currentValue = values.start;
			values = null;
			
			slider.addEventListener( MeasureEvent.VALUE_CHANGE, onSliderChange );
			slider.mouseOutFunc = onMouseOut;
			slider.mouseOverFunc = onMouseOver;
			
			return slider;
			
		}
		
		
		
		private function onSliderChange( e:MeasureEvent ):void {
			
			
			
		}
		
		
		
		private function onMouseOver( e:MouseEvent ):void {
			
			
			
		}
		
		
		
		private function onMouseOut( e:MouseEvent ):void {
			
			
			
		}
		
		
		
	}
}