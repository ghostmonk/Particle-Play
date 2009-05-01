package com.ghostmonk.events {
	
	import flash.events.Event;
	
	
	/**
	 * 
	 * @author ghostmonk
	 * 
	 */
	public class ExtendedToggleEvent extends ToggleEvent {
		
		public static const TOGGLE_PARTICLES:String = "toggleParticles";
		
		/**
		 * 
		 * @param type
		 * @param isTrue
		 * @param bubbles
		 * @param cancelable
		 * 
		 */
		public function ExtendedToggleEvent( type:String, isTrue:Boolean, bubbles:Boolean=false, cancelable:Boolean=false ) {
			
			super(type, isTrue, bubbles, cancelable);
			
		}
		
		
		/**
		 * 
		 * @return 
		 * 
		 */
		override public function clone():Event {
			
			return new ExtendedToggleEvent( type, isTrue ); 
			
		}
		
	}
}