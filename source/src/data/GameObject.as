package src.data
{	
	public class GameObject
	{	
		public static const FINISH_FLAG:	String = "table_world_0_b";
		
		private var _texture:		String;
		
		private var _x:				Number;
		private var _y:				Number;
		private var _rotation:		Number;
		private var _pivotX:		Number;
		private var _pivotY:		Number;
		
		public function GameObject( texture:String, x:Number, y:Number, rotation:Number ):void
		{
			_texture = texture;
			_x = x;
			_y = y;
			_rotation = rotation;
			switch ( _texture ) {
				case FINISH_FLAG:
					_pivotX = 6;
					_pivotY = 66;
					break;
			}
		}
		
		public function get pivotX () :Number {
			return _pivotX;
		}

		public function get pivotY () :Number {
			return _pivotY;
		}
		
		public function get texture () :String {
			return _texture;
		}

		public function get x () :Number {
			return _x;
		}

		public function get y () :Number {
			return _y;
		}

		public function get rotation () :Number {
			return _rotation;
		}
		
	}
		
}