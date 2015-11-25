package src.data
{
	public class CarData
	{
		private var _name:String;
		private var _speed:Number;
		private var _rotation:Number;
		private var _damping:Number;
		private var _carBodyXOffset:Number;
		private var _carBodyYOffset:Number;

		private var _id:int;
		private var _graphicID:uint;
		private var _starRequired:uint;

		public function CarData( id:uint, graphicID:uint, name:String, starRequired:uint, speed:Number, rotation:Number, damping:Number, carBodyXOffset:Number, carBodyYOffset:Number ):void
		{
			this._id = id;
			this._graphicID = graphicID;
			this._name = name;
			this._starRequired = starRequired;
			this._speed = speed;
			this._rotation = rotation;
			this._damping = damping;
			this._carBodyXOffset = carBodyXOffset;
			this._carBodyYOffset = carBodyYOffset;
		}

		public function get name():String
		{
			return this._name;
		}

		public function get speed():Number
		{
			return this._speed;
		}

		public function get rotation():Number
		{
			return this._rotation;
		}

		public function get damping():Number
		{
			return this._damping;
		}

		public function get carBodyXOffset():Number
		{
			return this._carBodyXOffset;
		}

		public function get carBodyYOffset():Number
		{
			return this._carBodyYOffset;
		}

		public function get id():uint
		{
			return this._id;
		}

		public function get graphicID():uint
		{
			return this._graphicID;
		}

		public function get starRequired():uint
		{
			return this._starRequired;
		}
	}
}