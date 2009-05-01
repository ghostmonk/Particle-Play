package com.ghostmonk.events {
	
	import flash.events.Event;

	/**
	 * 
	 * @author ghostmonk
	 * 
	 */
	public class PanelControlEvent extends Event {
		
		/**
		 * 
		 * @param type
		 * @param bubbles
		 * @param cancelable
		 * 
		 */
		public function PanelControlEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) {
			
			super(type, bubbles, cancelable);
			
		}
		
	}
}