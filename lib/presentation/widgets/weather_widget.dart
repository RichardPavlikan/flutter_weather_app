import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_weather_app/logic/data/model/weather_model.dart';
import 'package:flutter_weather_app/presentation/widgets/divider_widget.dart';

/// [WeatherWidget] is the widget for the weather data.
class WeatherWidget extends StatelessWidget {
  /// The weather model.
  final WeatherModel weatherModel;

  /// Creates the weather widget.
  const WeatherWidget({required this.weatherModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ...weatherModel.background!,
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.transparent,
            ),
          ),
        ),
        SafeArea(
          child: Center(
            child: Column(
              children: [
                Text(
                  weatherModel.emoji!,
                  style: const TextStyle(
                    fontSize: 150,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.location_on_rounded,
                      color: Theme.of(context).colorScheme.primary,
                      size: 30,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      weatherModel.locationName,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Temperature: ${weatherModel.temperature.toStringAsFixed(0)} °C",
                    ),
                    Text(
                      "Wind speed: ${weatherModel.windSpeed.toStringAsFixed(0)} km/h",
                    ),
                  ],
                ),
                const AppDivider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Humidity: ${weatherModel.humidity.toStringAsFixed(0)} %",
                    ),
                    Text(
                      "Pressure: ${weatherModel.pressure.toStringAsFixed(0)} hPa",
                    ),
                  ],
                ),
                const AppDivider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Sunrise: ${DateTime.fromMillisecondsSinceEpoch(weatherModel.sunrise * 1000).hour}:${DateTime.fromMillisecondsSinceEpoch(weatherModel.sunrise * 1000).minute}",
                    ),
                    Text(
                      "Sunset: ${DateTime.fromMillisecondsSinceEpoch(weatherModel.sunset * 1000).hour}:${DateTime.fromMillisecondsSinceEpoch(weatherModel.sunset * 1000).minute}",
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
