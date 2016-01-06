/**
 * Created by newkrok on 11/10/15.
 */
package src.game.module.snow
{
	import net.fpp.starling.module.AModule;

	public class Snow extends AModule
	{
		private const NUMBER_OF_SNOWFLAKE:uint = 100;

		private var _snowflakes:Vector.<Snowflake> = new <Snowflake>[];

		public function Snow()
		{
			touchable = false;

			for( var i:int = 0; i < NUMBER_OF_SNOWFLAKE; i++ )
			{
				var snowflake:Snowflake = new Snowflake();
				snowflake.touchable = false;
				addChild( snowflake );

				_snowflakes.push( snowflake );
			}
		}

		public function update():void
		{
			for( var i:int = 0; i < NUMBER_OF_SNOWFLAKE; i++ )
			{
				_snowflakes[ i ].update();
			}
		}

		override public function dispose():void
		{
			if( _snowflakes )
			{
				for( var i:int = 0; i < NUMBER_OF_SNOWFLAKE; i++ )
				{
					_snowflakes[ i ].dispose();
					_snowflakes[ i ] = null;
				}
				_snowflakes.length = 0;
				_snowflakes = null;
			}

			super.dispose();
		}
	}
}