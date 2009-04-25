package com.ghostmonk.ui {
	
	import caurina.transitions.Tweener;
	
	import com.ghostmonk.events.ExtendedToggleEvent;
	import com.ghostmonk.events.ToggleEvent;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	[ Event ( name="toggle", type="com.ghostmonk.events.ToggleEvent" ) ]
	[ Event ( name="toggleParticles", type="com.ghostmonk.events.ExtendedToggleEvent" ) ]
	
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
		private var _isOpen:Boolean;
			
		
		/**
		 * 
		 * @param controlsAlpha
		 * @param startupData
		 * 
		 */
		public function SystemControlPanel( ctPanel:ColorTransformControls, glowPanel:GlowFilterControls, particlePanel:ParticleControls, perlinPanel:PerlinControls ) {
			
			panelToggle.stop(); 
			panelToggle.buttonMode = true;
			panelToggle.addEventListener( MouseEvent.CLICK, onClick );
			
			_particlePanel = particlePanel;
			_particlePanel.y = panelToggle.height + 5;
			_particlePanel.addEventListener( ToggleEvent.TOGGLE, togglePerlinView );
			_particlePanel.addEventListener( ExtendedToggleEvent.TOGGLE_PARTICLES, toggleParticles );
			
			_perlinPanel = perlinPanel;
			_ctPanel = ctPanel;
			_glowPanel = glowPanel;
			
			
			addEventListener( Event.ADDED_TO_STAGE, onAddedToStage );
			
			_isOpen = false;
			
			addChild( _particlePanel );
		}
		
		
		
		private function onAddedToStage(e:Event = null):void {
			
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			y = stage.stageHeight - panelToggle.height;
			
		}
		
		
		
		private function onClick( e:MouseEvent ):void {
			
			_isOpen = !_isOpen;
			
			if( _isOpen ) {
				Tweener.addTween( this, { y:stage.stageHeight - this.height, time:0.3 } );
				panelToggle.gotoAndStop( 2 );
			}
			else {
				Tweener.addTween( this, { y:stage.stageHeight - panelToggle.height, time:0.3 } );
				panelToggle.gotoAndStop( 1 );	
			}
			
		}
		
		
		private function togglePerlinView( e:ToggleEvent ):void {
			
			dispatchEvent( e );
			
		}
		
		
		private function toggleParticles( e:ExtendedToggleEvent ):void {
			
			dispatchEvent( e );
			
		}
		
		
		
	}
}