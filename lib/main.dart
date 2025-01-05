import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/logic/cubit/weather/weather_cubit.dart';
import 'package:flutter_weather_app/logic/data/repository/weather_repository.dart';
import 'package:flutter_weather_app/logic/data/service/weather_service.dart';
import 'package:flutter_weather_app/presentation/router/app_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(
    App(
      appRouter: AppRouter(),
    ),
  );
}

/// [App] is the root widget of the application.
class App extends StatelessWidget {
  /// Creates the root widget of the application.
  const App({required this.appRouter, super.key});

  /// The application router.
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, deviceType) {
      return MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            create: (context) =>
                WeatherRepository(weatherService: WeatherService()),
          ),
        ],
        child: BlocProvider(
          create: (context) => WeatherCubit(
            weatherRepository: context.read<WeatherRepository>(),
          ),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData.dark().copyWith(
              textTheme: TextTheme(
                titleLarge: GoogleFonts.raleway(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.bold,
                ),
                bodyMedium: GoogleFonts.raleway(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.normal,
                ),
                bodyLarge: GoogleFonts.raleway(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.normal,
                ),
              ),
              cardTheme: CardTheme(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              buttonTheme: ButtonThemeData(
                buttonColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            title: "Flutter Weather App",
            onGenerateRoute: appRouter.onGenerateRoute,
          ),
        ),
      );
    });
  }
}
