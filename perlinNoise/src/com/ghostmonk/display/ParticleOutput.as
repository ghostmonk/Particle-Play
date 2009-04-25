package com.ghostmonk.display {
	
	import com.ghostmonk.organic.BasicPerlinData;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.PixelSnapping;
	import flash.geom.Point;

	/**
	 * 
	 * @author ghostmonk
	 * 
	 */
	public class ParticleOutput extends Bitmap {
		
		private var _particles:Array;
		private var _speeds:Array;
		private var _visibleParticles:int;
		private var _particleColor:uint;
		
		
		
		public function set visibleParticles( value:int ):void {
			
			_visibleParticles = value;
			
		}

		
		public function ParticleOutput( bitmapData:BitmapData=null, pixelSnapping:String="auto", smoothing:Boolean=false ) {
			
			super( bitmapData, pixelSnapping, smoothing );
			
			_particles = new Array();
			_speeds = new Array();
			
		}
		
		
		
		public function createParticles( amount:int, minSpeed:Number, maxSpeed:Number, color:uint ):void {
			
			_particleColor = color;
			
			for( var i:int = 0; i < amount; i++ ) {
				
				var particle:Point =  new Point();
				particle.x = stage.stageWidth / amount * i;
				particle.y = 0;
				
				_particles.push( particle );
				_speeds.push( Math.random() * maxSpeed + minSpeed );
				
			}
			
		}
		
		
		public function perlinParticleMovement( perlinData:BasicPerlinData, dataScale:Number ):void {
			
			
			for( var i:int = 0; i < _visibleParticles; i++ ) {
				
				var particle:Point = _particles[ i ];
				
				if( particle.x > stage.stageWidth ) {
					
					particle.x = 2;
					
				}
				else if( particle.x < 0 ) {
					
					particle.x = stage.stageWidth - 2;
					
				}
				else if( particle.y >= stage.stageHeight ) {
					
					particle.y = 0;
					
				}
				else if( particle.y < 0) {
					
					particle.y = stage.stageHeight - 1;
					
				}
				
				var rads:Number = perlinData.getDataPoint( particle.x / dataScale, particle.y / dataScale) * 2 * Math.PI;
				var speed:Number = _speeds[ i ];
				
				particle.x += Math.cos( rads ) * speed;
				particle.y += Math.sin( rads ) * speed;
				
				bitmapData.setPixel32( particle.x, particle.y, _particleColor );  
				
			}
			
		}
		
		
		
	}
}