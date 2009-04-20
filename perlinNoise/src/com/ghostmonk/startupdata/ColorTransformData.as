package com.ghostmonk.startupdata
{
	public class ColorTransformData
	{
		
		private var _ctMultiplier:Object;
		private var _ctOffset:Object;
		
		
		
		public function get multiplier():Object {
			
			return _ctMultiplier;
			
		}
		
		
		
		public function get offset():Object {
			
			return _ctOffset;
			
		}
		
		
		
		
		public function ColorTransformData()
		{
			
			_ctMultiplier = { min:0, max:1, start:1 };
			_ctOffset = { min:-255, max:255, start:0 };
			
		}

	}
}