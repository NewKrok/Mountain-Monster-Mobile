package src.assets
{
	public class EmbeddedAssets2x
	{
		[Embed(source="../../../assets/texture/atlas.png")]
		public static const atlas:Class;
		[Embed(source="../../../assets/texture/atlas.xml", mimeType="application/octet-stream")]
		public static const atlas_xml:Class;

		[Embed(source="../../../assets/texture/atlas3.png")]
		public static const atlas3:Class;
		[Embed(source="../../../assets/texture/atlas3.xml", mimeType="application/octet-stream")]
		public static const atlas3_xml:Class;

	}
}