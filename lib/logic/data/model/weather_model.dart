// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_weather_app/constants/weather_enum.dart';

/// [WeatherModel] is the model class for the weather data.
class WeatherModel {
  /// [weatherId] is the ID of the weather condition.
  int weatherId;

  /// [status] is the status of the weather condition.
  String status;

  /// [temperature] is the temperature in Celsius.
  double temperature;

  /// [pressure] is the pressure in hPa.
  int pressure;

  /// [humidity] is the humidity in percentage.
  int humidity;

  /// [windSpeed] is the wind speed in m/s.
  double windSpeed;

  /// [sunrise] is the sunrise time in Unix timestamp.
  int sunrise;

  /// [sunset] is the sunset time in Unix timestamp.
  int sunset;

  /// [locationName] is the name of the location.
  String locationName;

  /// [weatherEnum] is the [WeatherEnum] based on the [weatherId].
  WeatherEnum? weatherEnum;

  /// [emoji] is the emoji based on the [weatherEnum].
  String? emoji;

  /// [background] is the list of [Widget] for the background based on the [weatherEnum].
  List<Widget>? background;

  /// [WeatherModel] requires the following parameters.
  WeatherModel({
    required this.weatherId,
    required this.status,
    required this.temperature,
    required this.pressure,
    required this.humidity,
    required this.windSpeed,
    required this.sunrise,
    required this.sunset,
    required this.locationName,
    this.weatherEnum,
    this.emoji,
    this.background,
  });

  /// [fromMap] is a factory method to create a [WeatherModel] from a [Map].
  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    Map<String, dynamic> weatherMap = (map['weather'] as List<dynamic>).first;

    return WeatherModel(
      weatherId: weatherMap['id'] as int,
      status: weatherMap['main'] as String,
      temperature: map['main']['temp'] as double,
      pressure: map['main']['pressure'] as int,
      humidity: map['main']['humidity'] as int,
      windSpeed: map['wind']['speed'] as double,
      sunrise: map['sys']['sunrise'] as int,
      sunset: map['sys']['sunset'] as int,
      locationName: map['name'] as String,
    );
  }

  /// [fromJson] is a factory method to create a [WeatherModel] from a JSON [String].
  factory WeatherModel.fromJson(String source) =>
      WeatherModel.fromMap(json.decode(source) as Map<String, dynamic>);

  /// [toJson] is a method to convert a [WeatherModel] to a JSON [String].
  WeatherModel copyWith({
    int? weatherId,
    String? status,
    double? temperature,
    int? pressure,
    int? humidity,
    double? windSpeed,
    int? sunrise,
    int? sunset,
    String? locationName,
    WeatherEnum? weatherEnum,
    String? emoji,
    List<Widget>? background,
  }) {
    return WeatherModel(
      weatherId: weatherId ?? this.weatherId,
      status: status ?? this.status,
      temperature: temperature ?? this.temperature,
      pressure: pressure ?? this.pressure,
      humidity: humidity ?? this.humidity,
      windSpeed: windSpeed ?? this.windSpeed,
      sunrise: sunrise ?? this.sunrise,
      sunset: sunset ?? this.sunset,
      locationName: locationName ?? this.locationName,
      weatherEnum: weatherEnum ?? this.weatherEnum,
      emoji: emoji ?? this.emoji,
      background: background ?? this.background,
    );
  }
}
