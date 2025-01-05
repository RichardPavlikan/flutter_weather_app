import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/logic/cubit/weather/weather_cubit.dart';
import 'package:flutter_weather_app/presentation/widgets/loading_widget.dart';
import 'package:flutter_weather_app/presentation/widgets/weather_widget.dart';

/// [HomeScreen] is the home screen of the application.
class HomeScreen extends StatefulWidget {
  /// Creates the home screen.
  const HomeScreen({super.key});

  /// The route name for the home screen.
  static const String routeName = '/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    /// Fetch weather data for Brno.
    BlocProvider.of<WeatherCubit>(context)
        .getWeatherData(lat: 49.1951, lon: 16.6068);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BlocConsumer<WeatherCubit, WeatherState>(
            listener: (context, state) {
              if (state is WeatherFailed) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.errorMessage),
                  ),
                );
              }
            },
            builder: (context, state) {
              /// Show loading widget if the state is [WeatherLoading].
              if (state is WeatherLoading) {
                return const LoadingWidget();
              }

              /// Show error message if the state is [WeatherFailed].
              else if (state is WeatherFailed) {
                return Center(child: Text(state.errorMessage));
              }

              /// Show weather widget if the state is [WeatherLoaded].
              else if (state is WeatherLoaded) {
                return WeatherWidget(weatherModel: state.weatherModel);
              }

              /// Show error message if the state is unknown.
              return const Text("Something went wrong!");
            },
          ),
          const SizedBox(height: 20),
          const Text("© Richard Pavlikán, 2024")
        ],
      )),
    );
  }
}
