class Sys {
  final int? type;
  final int? id;
  final String? country;
  final int? sunrise;
  final int? sunset;

  Sys({this.type, this.id, this.country, this.sunrise, this.sunset});

  factory Sys.fromJson(Map<String, dynamic> json) {
    return Sys(
      type: json['type'],
      id: json['id'],
      country: json['country'],
      sunrise: json['sunrise'],
      sunset: json['sunset'],
    );
  }
  Map<String, dynamic> toJson(){
    return {
      'type':this.type,
      'id':this.id,
      'country':this.country,
      'sunrise':this.sunrise,
      'sunset':this.sunset,
    };

  }

}
