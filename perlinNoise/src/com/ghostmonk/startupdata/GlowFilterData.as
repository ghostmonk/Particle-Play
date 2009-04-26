package com.ghostmonk.startupdata
{
	public class GlowFilterData
	{
		
		private var _startColor:uint;
		private var _glowReveal:Boolean;
		private var _glowAlpha:Object;
		private var _glowStrength:Object;
		private var _glowQuality:Object;
		private var _glowBlur:Object;
		
		
		
		public function get color():uint {
			
			return _startColor;
				
		}
		
		
		
		public function get glowToggle():Boolean {
			
			return _glowReveal;
			
		}
		
		
		
		public function get alpha():Object {
			
			return _glowAlpha;
			
		}
		
		
		
		public function get glowStrength():Object {
			
			return _glowStrength;
			
		}
		
		
		
		public function get glowQuality():Object {
			
			return _glowQuality;
			
		}
		
		
		
		public function get glowBlur():Object {
			
			return _glowBlur;
			
		}
		
		
		
		public function GlowFilterData() {
			
			_startColor = 0x00FF00;
			_glowReveal = false;
			_glowAlpha = { min:0, max:1, start:0.5 };
			_glowStrength = { min:0, max:10, start:3 };
			_glowQuality = { min:0, max:10, start:3 };
			_glowBlur = { xstart:0.5, ystart:0.5, max:10 };
			
		}

	}
}