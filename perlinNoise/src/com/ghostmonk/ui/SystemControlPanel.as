package com.ghostmonk.ui {
	
	import caurina.transitions.Tweener;
	
	import com.ghostmonk.events.ExtendedToggleEvent;
	import com.ghostmonk.events.MeasureEvent;
	import com.ghostmonk.events.ToggleEvent;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	[ Event ( name="toggle", type="com.ghostmonk.events.ToggleEvent" ) ]
	[ Event ( name="toggleParticles", type="com.ghostmonk.events.ExtendedToggleEvent" ) ]
	[ Event ( name="valueChange", type="com.ghostmonk.events.MeasureEvent" ) ]
	
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
		
		private var _currentPanel:Sprite;
			
		
		/**
		 * 
		 * @param controlsAlpha
		 * @param startupData
		 * 
		 */
		public function SystemControlPanel( ctPanel:ColorTransformControls, glowPanel:GlowFilterControls, particlePanel:ParticleControls, perlinPanel:PerlinControls ) {
			
			toggleBtn.stop();
			toggleBtn.buttonMode = true;
			toggleBtn.mouseChildren = false;
			toggleBtn.addEventListener( MouseEvent.CLICK, onClick );
			
			createContolButton( particles, "Particles" );
			createContolButton( colorTrail, "Color" );
			createContolButton( perlin, "Perlin" );
			createContolButton( glow, "Glow" );
			
			_particlePanel = particlePanel;
			
			_particlePanel.addEventListener( ToggleEvent.TOGGLE, togglePerlinView );
			_particlePanel.addEventListener( ExtendedToggleEvent.TOGGLE_PARTICLES, toggleParticles );
			_particlePanel.addEventListener( MeasureEvent.VALUE_CHANGE, onPerlinResChange );
			
			_perlinPanel = perlinPanel;
			
			_ctPanel = ctPanel;
			
			_glowPanel = glowPanel;
			
			addEventListener( Event.ADDED_TO_STAGE, onAddedToStage );
			
			_isOpen = false;
			
		}
		
		
		
		private function onAddedToStage(e:Event = null):void {
			
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			y = stage.stageHeight - perlin.height;
			
		}
		
		
		
		private function onClick( e:MouseEvent ):void {
			
			if( _isOpen ) {
				close();
			}
			else {
				open();
			}
			
		}
		
		
		
		private function togglePerlinView( e:ToggleEvent ):void {
			
			dispatchEvent( e );
			
		}
		
		
		
		private function toggleParticles( e:ExtendedToggleEvent ):void {
			
			dispatchEvent( e );
			
		}
		
		
		
		private function onPerlinResChange( e:MeasureEvent ):void {
			
			dispatchEvent( e );
			
		}
		
		
		
		private function createContolButton( button:Sprite, label:String ):void {
			
			button.buttonMode = true;
			button.mouseChildren = false;
			TextField( button.getChildByName( "label" ) ).text = label;
			button.addEventListener( MouseEvent.CLICK, onSectionClick );
			
		}
		
		
		private function onSectionClick( e:MouseEvent ):void {
			
			if( !_isOpen ) {
				open();
			}
			
			if( _currentPanel != null ) {
				buildOut();
			}
			
			switch( e.target) {
				
				case colorTrail:
					buildIn( _ctPanel ); 
					break;
				
				case glow:
					buildIn( _glowPanel );
					break;
					
				case particles:
					buildIn( _particlePanel );
					break;
					
				case perlin:
					buildIn( _perlinPanel );
					break;
					
				default:
					throw new Error( "This should never happen" );
				
			}
			
		}
		
		
		private function open():void {
			
			_isOpen = true;
			Tweener.addTween( this, { y:stage.stageHeight - this.height, time:0.3 } );
			toggleBtn.gotoAndStop( 2 );
			
		}
		
		private function close():void {
			
			_isOpen = false;
			Tweener.addTween( this, { y:stage.stageHeight - perlin.height, time:0.3 } );
			toggleBtn.gotoAndStop( 1 );
			
		}
		
		private function buildIn( sprite:Sprite ):void {
			
			addChild( sprite );
			sprite.x = -sprite.width;
			Tweener.addTween( sprite, { x:0, time:0.3 } );
			_currentPanel = sprite;
			
		}
		
		
		private function buildOut():void {
			
			Tweener.addTween( 
				_currentPanel, { 
					x:stage.stageWidth, 
					time:0.3, 
					onComplete:this.removeChild, 
					onCompleteParams:[ _currentPanel ] 
				} 
			);
			
		}
		
		
	}
}