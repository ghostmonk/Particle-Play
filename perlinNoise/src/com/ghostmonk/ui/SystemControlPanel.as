package com.ghostmonk.ui {
	
	import caurina.transitions.Tweener;
	
	import flash.display.Bitmap;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	 * A collection of user interface controls to change the output of a particle system
	 * 
	 * @author ghostmonk
	 * 
	 */
	public class SystemControlPanel extends MainPanelAsset {
		
		
		private var _ctPanel:ColorTransformControls;
		private var _glowPanel:GlowFilterControls;
		private var _particlePanel:ParticleControls;
		private var _perlinPanel:PerlinControls;
			
		
		/**
		 * 
		 * @param controlsAlpha
		 * @param startupData
		 * 
		 */
		public function SystemControlPanel( ctPanel:ColorTransformControls, glowPanel:GlowFilterControls, particlePanel:ParticleControls, perlinPanel:PerlinControls ) {
			
			panelToggle.stop(); 
			
			_ctPanel = ctPanel;
			_glowPanel = glowPanel;
			_particlePanel = particlePanel;
			_perlinPanel = perlinPanel;
			
			addChild( _perlinPanel );
			_perlinPanel.y = panelToggle.height + 5;
			
			addEventListener( Event.ADDED_TO_STAGE, onAddedToStage );
			addEventListener( MouseEvent.ROLL_OVER, onRollOver );
			addEventListener( MouseEvent.ROLL_OUT, onRollOut );
			
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
		
		
		
	}
}