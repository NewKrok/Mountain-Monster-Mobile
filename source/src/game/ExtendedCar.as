package src.game
{
	import Box2D.Dynamics.b2World;

	import box2dassets.Car;

	import src.data.CarData;

	public class ExtendedCar extends Car
	{
		private var _speed:Number = 5;
		private var _rotationSpeed:Number = 20;
		private var _damping:Number = 1;

		public var lastAngleOnGround:Number = 0;
		public var jumpAngle:Number = 0;

		public var onAirStartGameTime:Number = 0;
		public var onWheelieStartGameTime:Number = 0;

		private var _direction:int = 1;

		public var isOnAir:Boolean = false;
		public var isOnWheelie:Boolean = false;
		public var leftWheelOnAir:Boolean = false;
		public var rightWheelOnAir:Boolean = false;

		public function ExtendedCar( $world:b2World, $positionX:Number, $positionY:Number, $carData:CarData )
		{
			super( $world, $positionX, $positionY, false, Game.CAR_FILTER_CATEGORY, Game.CAR_FILTER_MASK );
			_speed = $carData.speed;
			_damping = $carData.damping;
			_rotationSpeed = $carData.rotation;
			overrideParams( {
				firstWheelXOffsetFromLT: 59 + $carData.carBodyXOffset,
				firstWheelYOffsetFromLT: 23 + $carData.carBodyYOffset,
				backWheelXOffsetFromLT: 2 + $carData.carBodyXOffset,
				backWheelYOffsetFromLT: 23 + $carData.carBodyYOffset,
				firstWheelRadius: 10,
				backWheelRadius: 10,
				bodyWidth: 60,
				bodyHeight: 10,
				hitAreaXOffsetFromLT: 15,
				hitAreaYOffsetFromLT: 10,
				hitAreaHeight: 10
			} );
			joinHertz = 8;
			graphicJoinHertz = 3;
			init( $positionX, $positionY );
			wheelLeft.SetLinearDamping( _damping );
			wheelRight.SetLinearDamping( _damping );
			carBody.SetLinearDamping( _damping );
		}

		public function accelerateToLeft():void
		{
			_direction = -1;

			wheelLeft.ApplyTorque( -_speed / 2 );
			wheelRight.ApplyTorque( -_speed / 2 );

			if( wheelLeft.GetAngularVelocity() < -_speed )
			{
				wheelLeft.SetAngularVelocity( -_speed );
			}

			if( wheelRight.GetAngularVelocity() < -_speed )
			{
				wheelRight.SetAngularVelocity( -_speed );
			}
		}

		public function accelerateToRight():void
		{
			_direction = 1;
			wheelLeft.ApplyTorque( _speed );
			wheelRight.ApplyTorque( _speed );
		}

		public function rotateLeft():void
		{
			carBody.ApplyTorque( -_rotationSpeed );
		}

		public function rotateRight():void
		{
			carBody.ApplyTorque( _rotationSpeed );
		}

		public function get damping():Number
		{
			return _damping;
		}
	}
}