package com.ghostmonk.organic {
	import flash.display.BitmapData;
	
	/** 
	 * @author ghostmonk
	 * 
	 */
	public class PerlinValues {
		
		
		
		private var _baseX:Number;
		private var _baseY:Number;
		private var _octaves:uint;
		private var _randomSeed:int;
		private var _stitch:Boolean;
		private var _fractalNoise:Boolean;
		private var _channelOptions:uint;
		private var _greyScale:Boolean;
		
		
		
		/**
		 * 
		 * @param value
		 * 
		 */
		public function set baseX( value:Number ):void {	
			_baseX = value;			
		}
		
		public function get baseX():Number {	
			return _baseX;			
		}
		
		
		
		/**
		 * 
		 * @param value
		 * 
		 */
		public function set baseY( value:Number ):void {	
			_baseY = value;			
		}
		
		public function get baseY():Number {	
			return _baseY;			
		}
		
		
		
		/**
		 * 
		 * @param value
		 * 
		 */
		public function set octaves( value:uint ):void {
			_octaves = value;
		}
		
		public function get octaves():uint {	
			return _octaves;		
		}
		
		
		
		/**
		 * 
		 * @param value
		 * 
		 */
		public function set randomSeed( value:int ):void {	
			_randomSeed = value;
		}
		
		public function get randomSeed():int {	
			return _randomSeed;		
		}
		
		
		
		/**
		 * 
		 * @param value
		 * 
		 */
		public function set stitch( value:Boolean ):void	{	
			_stitch = value;		
		}
		
		public function get stitch():Boolean {	
			return _stitch;			
		}
		
		
		
		/**
		 * 
		 * @param value
		 * 
		 */
		public function set fractalNoise( value:Boolean ):void {	
			_fractalNoise = value;	
		}
		
		public function get fractalNoise():Boolean	
		{	
			return _fractalNoise;
		}
		
		
		
		/**
		 * 
		 * @param value
		 * 
		 */
		public function set channelOptions( value:uint ):void {
			_channelOptions = value;
		}
		
		public function get channelOptions():uint {
			return _channelOptions;
		}
		
		
		
		/**
		 * 
		 * @param value
		 * 
		 */
		public function set greyScale( value:Boolean ):void {	
			_greyScale = value;		
		}
		
		public function get greyScale():Boolean {	
			return _greyScale;	
		}
		
		
		
		/**
		 * 
		 * @param baseX
		 * @param baseY
		 * @param octaves
		 * @param randomSeed
		 * @param stitch
		 * @param fractalNoise
		 * @param channelOptions
		 * @param greyScale
		 * 
		 */
		public function PerlinValues(
			baseX:Number = 50, 
			baseY:Number = 50, 
			octaves:uint = 3,
			randomSeed:int = 10, 
			stitch:Boolean = false, 
			fractalNoise:Boolean = false,
			channelOptions:uint = 3, 
			greyScale:Boolean = false)
		{
			_baseX = baseX;
			_baseY = baseY;
			_octaves = octaves;
			_randomSeed = randomSeed;
			_stitch = stitch;
			_fractalNoise = fractalNoise;
			_channelOptions = channelOptions;
			_greyScale = greyScale;
		}

	}
}