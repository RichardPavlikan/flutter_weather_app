part of 'weather_cubit.dart';

/// [WeatherState] is the base class for all states emitted by the [WeatherCubit].
sealed class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

/// [WeatherLoading] is the initial state of the [WeatherCubit].
final class WeatherLoading extends WeatherState {}

/// [WeatherLoaded] is the state emitted when the weather data is successfully loaded.
final class WeatherLoaded extends WeatherState {
  /// [weatherModel] is the model containing the weather data.
  final WeatherModel weatherModel;

  /// [WeatherLoaded] requires the [weatherModel] to be passed.
  const WeatherLoaded({required this.weatherModel});

  @override
  List<Object> get props => [weatherModel];
}

/// [WeatherFailed] is the state emitted when the weather data couldn't be loaded.
final class WeatherFailed extends WeatherState {
  /// [errorMessage] is the error message to be displayed.
  final String errorMessage;

  /// [WeatherFailed] requires the [errorMessage] to be passed.
  const WeatherFailed({required this.errorMessage});
}
