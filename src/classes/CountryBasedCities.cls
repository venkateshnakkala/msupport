public class CountryBasedCities {
   public   Map<String,Map<String,List<String>>> mapOfMaps {get;set;}
    public  list<String> countriesList{get;set;}
    public CountryBasedCities(){
    //completeMilestoneDate();
    //countries =new list<String>();
    
    }
    
    public list<String> getcountries() { 
        mapOfMaps = new Map<String,Map<String,List<String>>> ();
    countriesList = new list<String>();
        countriesList.addAll(completeMilestoneDate());
        system.debug('--countries set'+countriesList);
        
        return countriesList;
    }
    public  set<String> completeMilestoneDate(){
        List<City> cities = new List<City>();
	
	cities.add(new City('Mesa','Arizona','US'));
	cities.add(new City('Phoenix','Arizona','US'));
	cities.add(new City('Miami','Florida','US'));
	cities.add(new City('Patna','Bihar','IN'));
	cities.add(new City('Samastipur','Bihar','IN'));
	cities.add(new City('Brisbane','Queensland','AU'));
	cities.add(new City('Caboolture','Queensland','AU'));
	cities.add(new City('Airdrie','Alberta','CA'));
	cities.add(new City('Camrose','Alberta','CA'));
		
        mapOfMaps = new Map<String,Map<String,List<String>>>();
	 
	for(City  cityObj : Cities){
	
        if(mapOfMaps.containskey(cityObj.country)){
            mapOfMaps.get(cityObj.state);
        }
        else{
            List<String> citie = new List<String>();
            citie.add(cityObj.cityName);
           Map<String,List<String>> stateTocities=new Map<String,List<String>>();
            stateTocities.put(cityObj.state,citie);
            mapOfMaps.put(cityObj.country,stateTocities);
           system.debug('****Main Map values'+mapOfMaps.get(cityObj.country));
        }
	}
  system.debug('--mapOfMaps.keySet() '+mapOfMaps.keySet());
        return mapOfMaps.keySet();
    }
	public Class City{
	
		String cityName{ get; set; }
		String state{ get; set; }
		String country{ get; set; }
		
		public city(String cityName, String state, String country){
			this.cityName = cityName;
			this.state = state;
			this.country = country;
		}
		
	}  
    }