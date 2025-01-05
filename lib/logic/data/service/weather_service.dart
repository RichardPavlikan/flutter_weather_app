import 'package:http/http.dart' as http;

/// [WeatherService] is the service to fetch the weather data.
class WeatherService {
  /// [apiKey] is the API key to access the OpenWeatherMap API.
  final String apiKey = "";

  /// [baseUrl] is the base URL for the OpenWeatherMap API.
  final String baseUrl = "https://api.openweathermap.org/data/2.5/weather";

  /// [getWeatherData] fetches the weather data based on the [lat] and [lon].
  Future<String> getWeatherData(
      {required double lat, required double lon}) async {
    try {
      /// Construct the URL with the [lat], [lon], and [apiKey].
      String url = "$baseUrl?lat=$lat&lon=$lon&appid=$apiKey&units=metric";

      /// Fetch the weather data from the API.
      var response = await http.get(Uri.parse(url));

      /// Check if the response is successful.
      if (response.statusCode == 200) {
        return response.body;
      } else {
        /// Throw an exception if the response is not successful.
        throw Exception("Failed to load weather data: ${response.statusCode}");
      }
    } catch (e) {
      /// Throw an exception if there is an error.
      throw Exception(e);
    }
  }
}
