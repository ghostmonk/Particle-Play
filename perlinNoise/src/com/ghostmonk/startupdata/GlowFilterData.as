package com.ghostmonk.startupdata
{
	public class GlowFilterData
	{
		
		private var _glowReveal:Boolean;
		private var _glowAlpha:Object;
		private var _glowStrength:Object;
		private var _glowQuality:Object;
		private var _glowBlur:Object;
		
		
		
		public function get glowToggle():Boolean {
			
			return _glowReveal;
			
		}
		
		
		
		public function get alpha():Object {
			
			return _glowAlpha;
			
		}
		
		
		
		public function get glowStrength():Object {
			
			return _glowQuality;
			
		}
		
		
		
		public function get glowBlur():Object {
			
			return _glowBlur;
			
		}
		
		
		
		public function GlowFilterData() {
			
			_glowReveal = false;
			_glowAlpha = { min:0, max:1, start:0.99 };
			_glowStrength = { min:0, max:5, start:3 };
			_glowQuality = { min:0, max:5, start:3 };
			_glowBlur = { xstart:5, ystart:5 };
			
		}

	}
}