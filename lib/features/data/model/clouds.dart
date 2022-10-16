class Clouds {
  final int? all;

  Clouds({this.all});

  factory Clouds.fromJson(Map<String, dynamic> json) {
    return Clouds(
      //int.parse
      all:json['all'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'all': this.all,

    };
  }
}

