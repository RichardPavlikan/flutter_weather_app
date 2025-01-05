import 'package:flutter_weather_app/logic/data/model/weather_model.dart';
import 'package:flutter_weather_app/logic/data/service/weather_service.dart';
import 'package:flutter_weather_app/logic/util/weather_util.dart';

/// [WeatherRepository] is the repository to fetch the weather data.
class WeatherRepository {
  /// [weatherService] is the service to fetch the weather data.
  final WeatherService weatherService;

  /// [WeatherRepository] requires the [weatherService] to be passed.
  WeatherRepository({required this.weatherService});

  /// [getWeatherData] fetches the weather data based on the [lat] and [lon].
  Future<WeatherModel> getWeatherData(
      {required double lat, required double lon}) async {
    try {
      /// Fetch the weather data from the service.
      final response = await weatherService.getWeatherData(lat: lat, lon: lon);

      /// Parse the response to [WeatherModel].
      final weatherModel = WeatherModel.fromJson(response);

      /// Get the weather icon, emoji, and background based on the weather ID.
      final weatherEnum = WeatherUtil.getWeatherIcon(weatherModel.weatherId);

      /// Get the emoji and background based on the weather enum.
      final weatherEmoji = WeatherUtil.getWeatherEmoji(weatherEnum);

      /// Get the background based on the weather enum.
      final weatherBackground = WeatherUtil.getWeatherBackground(weatherEnum);

      /// Return the [WeatherModel] with the updated values.
      return weatherModel.copyWith(
        weatherEnum: weatherEnum,
        emoji: weatherEmoji,
        background: weatherBackground,
      );
    } catch (e) {
      throw Exception(e);
    }
  }
}
