package com.ghostmonk.events
{
	import flash.events.Event;

	public class PanelControlEvent extends Event
	{
		public function PanelControlEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
	}
}