package com.ghostmonk.organic {
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.geom.Point;
	
	/** 
	 * @author ghostmonk
	 * 
	 */
	public class BasicPerlinData extends Sprite {	
		
		
		
		private var _perlinValues:PerlinValues;
		private var _bitmapData:BitmapData;
		private var _bitmap:Bitmap;
		private var _points:Array;
		private var _speed:Number;
		
		
		/**
		 * 
		 * @return 
		 * 
		 */
		public function get perlinValues():PerlinValues {
			
			return _perlinValues;
			
		}
		
		
		
		/**
		 * 
		 * @return 
		 * 
		 */
		public function get bitmapData():BitmapData {
			return _bitmapData;
		}
		
		
		
		/**
		 * 
		 * @param width
		 * @param height
		 * @param scale
		 * 
		 */
		public function setBitmapSize( width:Number, height:Number, scale:Number ):void {
			
			_bitmapData = new BitmapData( width, height, false, 0xff000000 );
			_bitmap.scaleX = _bitmap.scaleY = scale;
			
		}
		
		
		
		/**
		 * 
		 * @param perlinValues
		 * @param width
		 * @param height
		 * @param scale
		 * @param speed
		 * 
		 */
		public function BasicPerlinData( perlinValues:PerlinValues, width:Number, height:Number, scale:Number, speed:int ) {		
			
			_perlinValues = perlinValues;
			_bitmapData = new BitmapData( width, height, false, 0xff000000 );
			_bitmap = new Bitmap( _bitmapData );
			_points = new Array();
			_speed = speed;
			
			_bitmap.scaleX = _bitmap.scaleY = scale;
			_bitmap.alpha = 1;
			
			
			for( var i:int = 0; i < _perlinValues.octaves; i++ ) {
				_points.push( new Point(0,0) );
			}
			
			toggleDisplay( true );
			
		}
		
		
		
		/**
		 * 
		 * @param x
		 * @param y
		 * @return 
		 * 
		 */
		public function getDataPoint( x:int, y:int ):Number {
			 
			var dataRange:Number = _bitmapData.getPixel( x, y ) /  16711422 * 255;
			return dataRange;
			
		}
		
		
		
		/**
		 * 
		 * @param visible
		 * 
		 */
		public function toggleDisplay( visible:Boolean ):void {
			
			if( visible ) {
				addChild( _bitmap );
			}
			else {
				removeChild( _bitmap );
			}
			
			renderData();
			
		}
		
		
		
		
		/**
		 * 
		 * @param value
		 * 
		 */
		public function changeChannel( value:int ):void {
			
			_perlinValues.channelOptions = value;
			renderData();
			
		}
		
		
		
		/**
		 * 
		 * @param value
		 * 
		 */
		public function changeSpeed( value:Number ):void {
			
			_speed = value;
			renderData();
			
		}
		
		
		
		/**
		 * 
		 * 
		 */
		public function renderData():void {
				
			_points[0].x -= _speed;
			_points[1].y -= _speed;
			_points[2].x -= _speed;
			
			_bitmapData.perlinNoise(
				_perlinValues.baseX, 
				_perlinValues.baseY, 
				_perlinValues.octaves,
				_perlinValues.randomSeed,
				_perlinValues.stitch,
				_perlinValues.fractalNoise,
				_perlinValues.channelOptions,
				_perlinValues.greyScale,
				_points
			);
				
		}
		
	}
}