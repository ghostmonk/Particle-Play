package com.ghostmonk.data {
	
	/**
	 * Data struct containing values to instantiate SystemControlPanel
	 * 
	 * @author ghostmonk 14/04/2009
	 * 
	 */
	public class ControlsStartupData {
		
		
		
		private var _particleAmount:Object;
		private var _perlinResolution:Object;
		private var _perlinOffset:Object;
		
		
		
		public function get particleAmount():Object {
			
			return _particleAmount;
			
		}
		
		
		public function get perlinResolution():Object {
			
			return _perlinResolution;
			
		}
		
		
		public function get perlinOffset():Object {
			
			return _perlinOffset;
			
		}
		
		
		
		public function ControlsStartupData() {
			
			_particleAmount = { min:1000, max:15000, start:7000 };
			_perlinResolution = { min:5, max:800, start:300 };
			_perlinOffset = { min:1, max:20, start:1 };
			
		}

	}
}