package com.ghostmonk.events {
	import flash.events.Event;
	
	
	public class ExtendedToggleEvent extends ToggleEvent {
		
		public static const TOGGLE_PARTICLES:String = "toggleParticles";
		
		public function ExtendedToggleEvent( type:String, isTrue:Boolean, bubbles:Boolean=false, cancelable:Boolean=false ) {
			
			super(type, isTrue, bubbles, cancelable);
			
		}
		
		
		override public function clone():Event {
			
			return new ExtendedToggleEvent( type, isTrue ); 
			
		}
		
	}
}