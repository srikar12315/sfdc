public class OpenCaseGeoCoder{
	public cls_results[] results;
	public cls_status status;
	class cls_results {
		public cls_components components;
		public Integer confidence;	//9
		public String formatted;	//Rua Cafelândia, Parque José Alexandre, Carapicuíba - SP, 06321-665, Brazil
		public cls_geometry geometry;
	}
	class cls_components {
		//public String ISO_3166-1_alpha-2;	//BR
		//public String ISO_3166-1_alpha-3;	//BRA
		//public String _category;	//road
		//public String _type;	//road
		public String city;	//Carapicuíba
		public String city_district;	//Carapicuíba
		public String continent;	//South America
		public String country;	//Brazil
		public String country_code;	//br
		public String county;	//Região Metropolitana de São Paulo
		public String municipality;	//Região Imediata de São Paulo
		public String postcode;	//06321-665
		public String region;	//Southeast Region
		public String road;	//Rua Cafelândia
		public String road_type;	//residential
		public String state;	//São Paulo
		public String state_code;	//SP
		public String state_district;	//Região Geográfica Intermediária de São Paulo
		public String suburb;	//Parque José Alexandre
	}
	class cls_geometry {
		public Double lat;	//-23.5370962
		public Double lng;	//-46.8359735
	}
	class cls_status {
		public Integer code;	//200
		public String message;	//OK
	}
    /*****
    
	public static OpenCageData parse(String json){
		return (OpenCageData) System.JSON.deserialize(json, OpenCageData.class);
	}

	static testMethod void testParse() {
		String json=		'{'+
		'  "results": ['+
		'    {'+
		'      "components": {'+
		'        "ISO_3166-1_alpha-2": "BR",'+
		'        "ISO_3166-1_alpha-3": "BRA",'+
		'        "_category": "road",'+
		'        "_type": "road",'+
		'        "city": "Carapicuíba",'+
		'        "city_district": "Carapicuíba",'+
		'        "continent": "South America",'+
		'        "country": "Brazil",'+
		'        "country_code": "br",'+
		'        "county": "Região Metropolitana de São Paulo",'+
		'        "municipality": "Região Imediata de São Paulo",'+
		'        "postcode": "06321-665",'+
		'        "region": "Southeast Region",'+
		'        "road": "Rua Cafelândia",'+
		'        "road_type": "residential",'+
		'        "state": "São Paulo",'+
		'        "state_code": "SP",'+
		'        "state_district": "Região Geográfica Intermediária de São Paulo",'+
		'        "suburb": "Parque José Alexandre"'+
		'      },'+
		'      "confidence": 9,'+
		'      "formatted": "Rua Cafelândia, Parque José Alexandre, Carapicuíba - SP, 06321-665, Brazil",'+
		'      "geometry": {'+
		'        "lat": -23.5370962,'+
		'        "lng": -46.8359735'+
		'      }'+
		'    }'+
		'  ],'+
		'  "status": {'+
		'    "code": 200,'+
		'    "message": "OK"'+
		'  }'+
		'}';
		OpenCageData obj = parse(json);
		System.assert(obj != null);
	}


    
     */
}