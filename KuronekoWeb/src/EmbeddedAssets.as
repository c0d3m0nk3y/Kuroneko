package
{
	

	public class EmbeddedAssets
	{
		/** ATTENTION: Naming conventions!
		 *  
		 *  - Classes for embedded IMAGES should have the exact same name as the file,
		 *    without extension. This is required so that references from XMLs (atlas, bitmap font)
		 *    won't break.
		 *    
		 *  - Atlas and Font XML files can have an arbitrary name, since they are never
		 *    referenced by file name.
		 * 
		 */
		
		[Embed(source="/textures/background.png")]
		public static const background:Class;
		
		// Texture Atlas
		
		[Embed(source="/textures/atlas.xml", mimeType="application/octet-stream")]
		public static const atlas_xml:Class;
		
		[Embed(source="/textures/atlas.png")]
		public static const atlas:Class;
		
		// Bitmap Fonts
		
//		[Embed(source="/fonts/cooperblacklg.fnt", mimeType="application/octet-stream")]
//		public static const cooperblacklg_fnt:Class;
//		
//		[Embed(source = "/fonts/cooperblacklg.png")]
//		public static const cooperblacklg:Class;
		
		// Sounds
		
		[Embed(source="/audio/pop.mp3")]
		public static const pop:Class;
	}
}