import 'package:equatable/equatable.dart';

class WeatherLocation extends Equatable {
  final String location;
  final int temperature;

  const WeatherLocation({required this.location, required this.temperature});

  @override
  List<Object> get props => [location, temperature];
}
