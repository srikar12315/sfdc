public class JSON2Apex {

	public String author;
	public List<Blogs> blogs;

	public class Blogs {
		public String id;
		public String title;
		public String url;
	}

	
	public static JSON2Apex parse(String json) {
		return (JSON2Apex) System.JSON.deserialize(json, JSON2Apex.class);
	}
}