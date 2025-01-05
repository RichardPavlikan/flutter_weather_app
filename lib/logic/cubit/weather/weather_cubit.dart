import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_weather_app/logic/data/model/weather_model.dart';
import 'package:flutter_weather_app/logic/data/repository/weather_repository.dart';

part 'weather_state.dart';

/// [WeatherCubit] is the business logic component for the weather data.
class WeatherCubit extends Cubit<WeatherState> {
  /// [weatherRepository] is the repository to fetch the weather data.
  final WeatherRepository weatherRepository;

  /// [WeatherCubit] requires the [weatherRepository] to be passed.
  WeatherCubit({required this.weatherRepository}) : super(WeatherLoading());

  /// [getWeatherData] fetches the weather data based on the [lat] and [lon].
  Future<void> getWeatherData(
      {required double lat, required double lon}) async {
    try {
      /// Emit the [WeatherLoading] state to indicate that the data is being fetched.
      emit(WeatherLoading());

      /// Fetch the weather data from the repository.
      final WeatherModel weatherModel =
          await weatherRepository.getWeatherData(lat: lat, lon: lon);

      /// Emit the [WeatherLoaded] state with the fetched [weatherModel].
      emit(WeatherLoaded(weatherModel: weatherModel));
    } catch (e) {
      /// Emit the [WeatherFailed] state with the error message.
      emit(WeatherFailed(errorMessage: "Couldn't fetch weather data: $e"));
    }
  }
}
