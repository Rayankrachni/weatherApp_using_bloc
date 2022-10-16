class Wind {
  final double? speed;
  final int? deg;

  Wind({this.speed, this.deg});

  factory Wind.fromJson(Map<String, dynamic> json) {

    return Wind(
      speed: double.parse(json['speed'].toString()),
      deg: json['deg'],
    );
  }
  Map<String, dynamic> toJson(){
    return {
      'speed':this.speed,
      'deg':this.deg,

    };

  }
}
