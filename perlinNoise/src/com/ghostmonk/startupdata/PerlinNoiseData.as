package com.ghostmonk.startupdata {
	
	
	/**
	 * 
	 * @author ghostmonk
	 * 
	 */
	public class PerlinNoiseData {
		
		
		private var _perlinBase:Object;
		private var _perlinRandomSeed:Object;
		private var _perlinChannel:Object;
		private var _perlinStitch:Boolean;
		private var _perlinFractalNoise:Boolean;
		private var _perlinGreyScale:Boolean;
		private var _speed:Object;
		
		
		
		
		/**
		 * 
		 * @return 
		 * 
		 */
		public function get perlinBase():Object {
			
			return _perlinBase;
			
		}
		
		
		
		/**
		 * 
		 * @return 
		 * 
		 */
		public function get perlinRandomSeed():Object {
			
			return _perlinRandomSeed;
			
		}
		
		
		
		/**
		 * 
		 * @return 
		 * 
		 */
		public function get perlinChannel():Object {
			
			return _perlinChannel;
			
		}
		
		
		
		/**
		 * 
		 * @return 
		 * 
		 */
		public function get stitch():Boolean {
			
			return _perlinStitch;
			
		}
		
		
		
		/**
		 * 
		 * @return 
		 * 
		 */
		public function get fractalNoise():Boolean {
			
			return _perlinFractalNoise;
			
		}
		
		
		
		/**
		 * 
		 * @return 
		 * 
		 */
		public function get greyScale():Boolean {
			
			return _perlinGreyScale;
			
		}
		
		
		/**
		 * 
		 * @return 
		 * 
		 */
		public function get speed():Object {
			
			return _speed;
			
		}
		
		
		
		/**
		 * 
		 * 
		 */
		public function PerlinNoiseData() {
			
			_perlinBase = { xstart:0.5, ystart:0.5 };
			_perlinRandomSeed = { min:1, max:800, start:7 };
			_perlinChannel = { min:1, max:7, start:3 };
			_perlinStitch = false;
			_perlinFractalNoise = false;
			_perlinGreyScale = false;
			_speed = { min:0, max:5, start:2, increment:0.05 };
			
		}

	}
}