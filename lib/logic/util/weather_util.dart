import 'package:flutter/material.dart';
import 'package:flutter_weather_app/constants/weather_enum.dart';

/// [WeatherUtil] is the utility class for weather data.
class WeatherUtil {
  /// [getWeatherIcon] returns the [WeatherEnum] based on the [id].
  static WeatherEnum getWeatherIcon(int id) {
    if (id >= 200 && id < 300) {
      return WeatherEnum.thunderstorm;
    } else if (id >= 300 && id < 400) {
      return WeatherEnum.drizzle;
    } else if (id >= 500 && id < 600) {
      return WeatherEnum.rain;
    } else if (id >= 600 && id < 700) {
      return WeatherEnum.snow;
    } else if (id >= 700 && id < 800) {
      return WeatherEnum.atmosphere;
    } else if (id == 800) {
      return WeatherEnum.clear;
    } else if (id > 800 && id < 900) {
      return WeatherEnum.clouds;
    } else {
      throw Exception('Unknown weather condition ID');
    }
  }

  /// [getWeatherEmoji] returns the emoji based on the [weatherEnum].
  static String getWeatherEmoji(WeatherEnum weatherEnum) {
    switch (weatherEnum) {
      case WeatherEnum.thunderstorm:
        return '⛈️';
      case WeatherEnum.drizzle:
        return '🌧️';
      case WeatherEnum.rain:
        return '🌧️';
      case WeatherEnum.snow:
        return '❄️';
      case WeatherEnum.atmosphere:
        return '🌫️';
      case WeatherEnum.clear:
        return '☀️';
      case WeatherEnum.clouds:
        return '☁️';
      default:
        throw Exception('Unknown weather condition');
    }
  }

  /// [getWeatherBackground] returns the list of [Widget] for the background based on the [weatherEnum].
  static List<Widget> getWeatherBackground(WeatherEnum weatherEnum) {
    switch (weatherEnum) {
      case WeatherEnum.thunderstorm:
        return [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 500,
              width: 400,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ];
      case WeatherEnum.drizzle:
        return [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 500,
              width: 400,
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.5),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ];
      case WeatherEnum.rain:
        return [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 500,
              width: 400,
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.5),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ];
      case WeatherEnum.snow:
        return [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 500,
              width: 400,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ];
      case WeatherEnum.atmosphere:
        return [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 500,
              width: 400,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.5),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ];
      case WeatherEnum.clear:
        return [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 500,
              width: 400,
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.5),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
        ];
      case WeatherEnum.clouds:
        return [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 500,
              width: 400,
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.5),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ];
      default:
        throw Exception('Unknown weather condition');
    }
  }
}
