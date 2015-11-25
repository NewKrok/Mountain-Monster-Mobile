package src.assets
{	
	import starling.text.BitmapFont;
	import starling.text.TextField;
	import starling.textures.Texture;
	
	public class Fonts
	{	
		[Embed(source="../../../assets/font/2x/aachen-light.png")]
		public static const FontAachenLightFont:Class;
		
		[Embed(source="../../../assets/font/2x/aachen-light.fnt", mimeType="application/octet-stream")]
		public static const FontAachenLight_xml:Class;
		
		public static var aachenLightFont:BitmapFont;
		
		public static function getAachenLightFont( ):BitmapFont
		{
			if ( !aachenLightFont )
			{
				var texture:Texture = Texture.fromBitmap( new FontAachenLightFont( ) );
				var xml:XML = XML( new FontAachenLight_xml( ) );
				aachenLightFont = new BitmapFont( texture, xml );
				aachenLightFont.offsetY = -5;
				TextField.registerBitmapFont( aachenLightFont );
			}
			return aachenLightFont;
		}
	}
}