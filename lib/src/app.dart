import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'features/provider/weather_provider.dart';
import 'features/ui/view/home_page.dart';

/// The Widget that configures your application.
class WeatherApp extends StatelessWidget {
  const WeatherApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      child: ChangeNotifierProvider<WeatherProvider>(
        create: (BuildContext context) =>
            WeatherProvider(), // Provide WeatherProvider
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          restorationScopeId: 'app',
          onGenerateRoute: (RouteSettings routeSettings) {
            return MaterialPageRoute<void>(
              settings: routeSettings,
              builder: (BuildContext context) {
                return const HomePage();
              },
            );
          },
        ),
      ),
    );
  }
}
