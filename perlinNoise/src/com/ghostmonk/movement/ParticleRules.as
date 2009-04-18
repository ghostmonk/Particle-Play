package com.ghostmonk.movement {
	import flash.display.Stage;
	
	
	/**
	 * This contains all of the rules for moveing particles on the stage
	 *  
	 * @author ghostmonk
	 * 
	 */
	public class ParticleRules {
		
		/**
		 * causes the particles to move from the bottom up, looping around the stage both from left to right, right to left, and top to bottom 
		 */
		public static const FLOW_UP:int = 0;
		
		
		/**
		 * causes the particles to move from the top to bottom, looping around the stage both from left to right, right to left and bottom to top 
		 */
		public static const FLOW_DOWN:int = 1;
		
		
		/**
		 * particles will move in either a positive or negative direction until they hit either the top or bottom wall, and then reverse direction
		 * particels continue to loop from left to right and right to left 
		 */
		public static const BOUND:int = 2;
		
		private var _type:int;
		
		
		
		/**
		 * Change the rules for particle movement
		 *  
		 * @param value use the public constants contained in ParticleRules
		 * 
		 */
		public function set type( value:int ):void {
			
			_type = value;
			
		}
		
		private var _stage:Stage;
		
		
		/**
		 * Set the initial rules for moving a particle
		 * <p>This non visual class needs a reference to stage for calculation</p>
		 *  
		 * @param type use the public constant contained in ParticleRules 
		 * @param stage a reference to the stage
		 * 
		 */
		public function ParticleRules( type:int, stage:Stage ) {
			
			_type = type;
			_stage = stage;
			
		}
		
		
		
		/**
		 * Call this function when on frame update. 
		 * This will calculate the new position of each particle.
		 * 
		 * @param particle the point of the particle destined to be rendered on stage
		 * 
		 */
		public function moveParticle( particle:Point ):void {
			
			switch ( _type ) {
				
				case FLOW_DOWN: 
					flowDown( particle );
					break;
				
				case FLOW_UP:
					flowUp( particle );
					break;
					
				case BOUND:
					bound( particle );
					break;
					
				default:
					throw new Error( "Something very wrong happened in ParticleRules in the moveParticle function" );
				
			}
			
		}
		
		
		
		private function flowUp( particle:Point ):void {
			
				
			if( particle.x > _stage.stageWidth ) {
				
				particle.x = 2;
				
			}
			else if( particle.x < 0 ) {
				
				particle.x = _stage.stageWidth - 2;
				
			}
			else if( particle.y >= _stage.stageHeight ) {
				
				particle.y = 0;
				
			}
			else if( particle.y < 0) {
				
				particle.y = _stage.stageHeight - 2;
				
			}
			
			var rads:Number = _perlinData.getDataPoint( particle.x / _dataScale, particle.y / _dataScale ) * 2 * Math.PI;
			var speed:Number = _speeds[ i ];
			
			particle.x -= Math.cos( rads ) * speed;
			particle.y -= Math.sin( rads ) * speed;
			
		}
		
		
		
		private function flowDown( particle:Point ):void {
			
			
			
		}
		
		
		
		private function bound( particle:Point ):void {
			
			
			
		}

	}
}