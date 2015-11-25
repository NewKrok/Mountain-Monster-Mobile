/**
 * Created by newkrok on 22/11/15.
 */
package src.assets
{
	import flash.display.BitmapData;

	import starling.textures.Texture;

	public class RuntimeTextures
	{
		public static const DARK_RECTANGLE:Texture = Texture.fromBitmapData( new BitmapData( 100, 100, false, 0x000000 ), false, false, 1, 'bgra', true );
	}
}