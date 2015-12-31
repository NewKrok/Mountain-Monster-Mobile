/**
 * Created by newkrok on 04/12/15.
 */
package src.assets
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.geom.Rectangle;

	import src.constant.CTerrainTextureType;

	import src.data.TerrainTextureVO;

	public class TerrainTextures
	{
		[Embed(source="../../../assets/texture/terrain_textures.png")]
		public static const AtlasImage:Class;

		[Embed(source="../../../assets/texture/terrain_textures.json", mimeType='application/octet-stream')]
		public static const AtlasDescription:Class;

		private static var _terrainTextureVOs:Vector.<TerrainTextureVO> = new <TerrainTextureVO>[];

		public static function init():void
		{
			var defaultBitmapData:BitmapData = ( new AtlasImage as Bitmap ).bitmapData;

			var jsonData:String = new String( new AtlasDescription() );
			var description:Object = JSON.parse( jsonData );

			for( var key:String in description.frames )
			{
				var terrainTextureVO:TerrainTextureVO = new TerrainTextureVO();
				terrainTextureVO.id = getIdFromKey( key );
				terrainTextureVO.type = getTypeFromKey( key );

				var isPixelFixNeeded:Boolean = terrainTextureVO.type == CTerrainTextureType.FILL_TEXTURE;
				var pixelFixOffset:int = isPixelFixNeeded ? 1 : 0;

				var bitmapData:BitmapData = new BitmapData(
						description.frames[ key ].spriteSourceSize.w - pixelFixOffset * 2,
						description.frames[ key ].spriteSourceSize.h - pixelFixOffset * 2
				);

				bitmapData.copyPixels(
						defaultBitmapData,
						new Rectangle(
								description.frames[ key ].frame.x + pixelFixOffset,
								description.frames[ key ].frame.y + pixelFixOffset,
								description.frames[ key ].frame.w - pixelFixOffset / 2,
								description.frames[ key ].frame.h - pixelFixOffset / 2
						),
						new Point()
				);

				terrainTextureVO.bitmapData = bitmapData;

				_terrainTextureVOs.push( terrainTextureVO );
			}

			defaultBitmapData.dispose();
			defaultBitmapData = null;
		}

		private static function getTypeFromKey( key:String ):String
		{
			return key.indexOf( 'terrain_fill_texture' ) > -1 ? CTerrainTextureType.FILL_TEXTURE : CTerrainTextureType.GROUND_TEXTURE;
		}

		private static function getIdFromKey( key:String ):uint
		{
			var tempResult:String = key;

			tempResult = tempResult.replace( 'terrain_fill_texture_', '' );
			tempResult = tempResult.replace( 'terrain_ground_texture_', '' );
			tempResult = tempResult.replace( '0000', '' );

			return uint( tempResult );
		}

		public static function getLevelPackTerrainGroundTexture( levelPackId:uint ):BitmapData
		{
			var length:int = _terrainTextureVOs.length;

			for ( var i:int = 0; i < length; i++ )
			{
				if ( _terrainTextureVOs[i].type == CTerrainTextureType.GROUND_TEXTURE && _terrainTextureVOs[i].id == levelPackId )
				{
					return _terrainTextureVOs[i].bitmapData.clone();
				}
			}

			return null;
		}

		public static function getLevelPackTerrainFillTexture( levelPackId:uint ):BitmapData
		{
			var length:int = _terrainTextureVOs.length;

			for ( var i:int = 0; i < length; i++ )
			{
				if ( _terrainTextureVOs[i].type == CTerrainTextureType.FILL_TEXTURE && _terrainTextureVOs[i].id == levelPackId )
				{
					return _terrainTextureVOs[i].bitmapData.clone();
				}
			}

			return null;
		}
	}
}