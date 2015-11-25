package src.utils
{
	
    import starling.display.Image;
    import starling.display.Sprite;

    public class SimpleProgressBar extends Sprite
    {
		
        private var _graphic:		Image;
        private var _backGraphic:	Image;
        
        public function SimpleProgressBar ( $graphic:Image, $backGraphic:Image ) {
			addChild ( _backGraphic = $backGraphic );
			addChild ( _graphic = $graphic );
			_graphic.scaleX = 0;
        }
        
        public function get ratio() :Number { return _graphic.scaleX; }
        public function set ratio( value:Number ) :void 
        {
			_graphic.scaleX = Math.max( 0, Math.min( 1, value ) ); 
        }
		
    }
	
}