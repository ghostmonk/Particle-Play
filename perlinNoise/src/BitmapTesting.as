package {
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.ColorTransform;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	[ SWF ( width=400, height=200, frameRate=100, backgroundColor=0x000000 ) ]
	
	public class BitmapTesting extends Sprite {
		
		private var _bitmap:Bitmap;
		private var _copyBitmap:Bitmap;
		private var _point:Point;
		private var _direction:int;
		
		private var _colorTransform:ColorTransform;
		private var _rect:Rectangle;
		
		public function BitmapTesting() {
			
			_colorTransform = new ColorTransform();
			_colorTransform.alphaMultiplier = 0.98;
			_point = new Point( 100, 0 );
			_direction = 1;
			
			_bitmap = new Bitmap( new BitmapData( 200, 200, true, 0x00000000 ) );
			_copyBitmap = new Bitmap( new BitmapData( 200, 200, true, 0x00000000 ) );		
			
			addChild( _bitmap );
			addChild( _copyBitmap );
			
			_rect =  new Rectangle( 0, 0, 200, 200 );
			
			
			_copyBitmap.bitmapData.colorTransform( _rect, _colorTransform ); 

			
			_copyBitmap.x = 200;

			
			addEventListener( Event.ENTER_FRAME, onEnterFrame );
		}
		
		private function onEnterFrame( e:Event ):void {
			
			if( _point.y > stage.stageHeight ) {
				_direction = -1;
			}
			else if( _point.y < 0 ) {
				_direction = 1;
			}
			
			_point.y += _direction;
			
			
			_bitmap.bitmapData.setPixel32( _point.x, _point.y, 0xFFFFFFFF );
			_bitmap.bitmapData.colorTransform( _rect, _colorTransform );
			
			_copyBitmap.bitmapData.draw( _bitmap );
			_copyBitmap.bitmapData.colorTransform(_rect, _colorTransform);
			
			var holderData:BitmapData = _bitmap.bitmapData.clone();
			_bitmap.bitmapData.colorTransform( _rect, _colorTransform );
			
			
			
		}
		
	}
}