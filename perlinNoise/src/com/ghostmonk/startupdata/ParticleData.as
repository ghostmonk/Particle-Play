package com.ghostmonk.startupdata
{
	public class ParticleData
	{
		
		private var _showPerlin:Boolean;
		private var _showParticles:Boolean;
		private var _particleColor:uint;
		private var _particleAmount:Object;
		private var _perlinResolution:Object;
		private var _perlinOffset:Object;
		private var _particleSpeed:Object;
		private var _controlsAlpha:Object;
		
		
		
		public function get showParticles():Boolean {
			
			return _showParticles;
			
		}
		
		
		
		public function get showPerlin():Boolean {
			
			return _showPerlin;
			
		}
		
		
		
		public function get particleColor():uint {
			
			return _particleColor;
			
		}
		
		
		public function get particleAmount():Object {
			
			return _particleAmount;
			
		}
		
		
		
		public function get perlinResolution():Object {
			
			return _perlinResolution;
			
		}
		
		
		
		public function get perlinOffset():Object {
			
			return _perlinOffset;
			
		}
		
		
		public function get particleSpeed():Object {
			
			return _particleSpeed;
			
		}
		
		
		
		public function get controlsAlpha():Object {
			
			return _controlsAlpha;
			
		}
		
			
			
		public function ParticleData() {
			
			_showParticles = true;
			_showPerlin = false;
			_particleColor = 0xFFFFFFFF;
			_particleAmount = { min:1000, max:15000, start:7000 };
			_perlinResolution = { min:5, max:800, start:300 };
			_perlinOffset = { min:1, max:20, start:1 };
			_particleSpeed = { min:1, max:20 };
			_controlsAlpha = { min:0, max:1, start:0.7 };
			
		}

	}
}