package src.data
{
	import flash.geom.Point;

	public class Level
	{
		private var _gameObjects:Vector.<GameObject> = new Vector.<GameObject>;

		private var _coinPoints:Vector.<Point> = new Vector.<Point>;
		private var _bridgePoints:Vector.<Point> = new Vector.<Point>;
		private var _groundPoints:Vector.<Point> = new Vector.<Point>;

		private var _starValues:Vector.<uint> = new Vector.<uint>;

		private var _libraryElements:Vector.<LibraryElementVO> = new Vector.<LibraryElementVO>;

		private var _startPoint:Point;
		private var _finishPoint:Point;

		private var _maxWidth:Number;
		private var _maxCameraY:Number;

		private var _id:uint;
		private var _levelPackID:uint;

		public function Level( levelPackID:uint, id:uint, maxWidth:Number, maxCameraY:Number, starValues:Vector.<uint>, levelEditorData:String ):void
		{
			_levelPackID = levelPackID;
			_id = id;
			_maxWidth = maxWidth;
			_maxCameraY = maxCameraY;
			_starValues = starValues;

			try
			{
				var levelEditorObject:Object = JSON.parse( levelEditorData );
			}
			catch( e:Error )
			{
				return;
			}

			for( var i:int = 0; i < levelEditorObject.groundPoints.length; i++ )
			{
				_groundPoints.push( new Point( levelEditorObject.groundPoints[ i ].x, levelEditorObject.groundPoints[ i ].y ) );
			}

			for( i = 0; i < levelEditorObject.starPoints.length; i++ )
			{
				_coinPoints.push( new Point( levelEditorObject.starPoints[ i ].x, levelEditorObject.starPoints[ i ].y ) );
			}

			if ( levelEditorObject.libraryElements )
			{
				for( i = 0; i < levelEditorObject.libraryElements.length; i++ )
				{
					_libraryElements.push( new LibraryElementVO( levelEditorObject.libraryElements[ i ].className, new Point( levelEditorObject.libraryElements[ i ].x, levelEditorObject.libraryElements[ i ].y ), levelEditorObject.libraryElements[ i ].scale ) );
				}
			}

			for( i = 0; i < levelEditorObject.bridgePoints.length; i++ )
			{
				_bridgePoints.push( new Point( levelEditorObject.bridgePoints[ i ].bridgeAX, levelEditorObject.bridgePoints[ i ].bridgeAY ) );
				_bridgePoints.push( new Point( levelEditorObject.bridgePoints[ i ].bridgeBX, levelEditorObject.bridgePoints[ i ].bridgeBY ) );
			}

			_finishPoint = new Point( levelEditorObject.finishPoint.x, levelEditorObject.finishPoint.y );
			_startPoint = new Point( levelEditorObject.startPoint.x, levelEditorObject.startPoint.y );

			_gameObjects.push(
					new GameObject( GameObject.FINISH_FLAG, _finishPoint.x, _finishPoint.y, 0 )
			);
		}

		public function scoreToStarCount( score:Number ):uint
		{
			var starCount:int = 0;

			for( var i:int = 0; i < _starValues.length; i++ )
			{
				if( score >= _starValues[ i ] )
				{
					starCount = i + 1;
				}
				else
				{
					return starCount;
				}
			}

			return starCount;
		}

		public function get startPoint():Point
		{
			return _startPoint;
		}

		public function get finishPoint():Point
		{
			return _finishPoint;
		}

		public function get gameObjects():Vector.<GameObject>
		{
			return _gameObjects;
		}

		public function get groundPoints():Vector.<Point>
		{
			return _groundPoints;
		}

		public function get coinPoints():Vector.<Point>
		{
			return _coinPoints;
		}

		public function get libraryElements():Vector.<LibraryElementVO>
		{
			return _libraryElements;
		}

		public function get bridgePoints():Vector.<Point>
		{
			return _bridgePoints;
		}

		public function get starValues():Vector.<uint>
		{
			return _starValues;
		}

		public function get id():uint
		{
			return _id;
		}

		public function get levelPackID():uint
		{
			return _levelPackID;
		}

		public function get maxWidth():Number
		{
			return _maxWidth;
		}

		public function get maxCameraY():Number
		{
			return _maxCameraY;
		}

	}
}