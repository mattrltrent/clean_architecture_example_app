import '../../domain/entities/weather_location.dart';

class WeatherModel extends WeatherLocation {
  const WeatherModel({
    required String location,
    required int temperature,
  }) : super(location: location, temperature: temperature);

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      location: json["sys"]["country"],
      temperature: (json["main"]["temp"] as num).toInt(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "location": location,
      "temperature": temperature,
    };
  }
}
