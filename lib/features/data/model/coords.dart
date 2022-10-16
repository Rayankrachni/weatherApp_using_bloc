class Coord
{
  double? lon;
  double? lat;

  Coord({this.lat,this.lon});

  factory Coord.fromJson(Map<String, dynamic> json){
    return Coord(
        lon: json['lon'],
        lat: json['lat']
    );
  }
  Map<String, dynamic> toJson(){
    return {
      'lon':this.lon,
      'lat':this.lat,
    };

  }




}