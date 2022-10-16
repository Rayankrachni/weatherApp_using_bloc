class FiveDaysData
{

  final String? datetime;
  final int? temp;

  FiveDaysData({this.datetime, this.temp});

  factory FiveDaysData.fromJson(Map<String, dynamic> json) {

    return FiveDaysData(
      datetime: json['speed'].toString(),
      temp: int.parse(json['deg']),
    );
  }
  Map<String, dynamic> toJson(){
    return {
      'datetime':this.datetime,
      'temp':this.temp,

    };

  }


}