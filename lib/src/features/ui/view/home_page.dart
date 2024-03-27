import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../provider/weather_provider.dart';
import '../widget/weather_widget.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Provider.of<WeatherProvider>(context, listen: false).fetchWeather();
    });
  }

  @override
  Widget build(BuildContext context) {
    final WeatherProvider weatherProvider =
        Provider.of<WeatherProvider>(context);
    if (weatherProvider.loading) {
      return _buildLoadingWidget(context);
    } else {
      if (weatherProvider.temperature != null) {
        return WeatherWidget(temperatures: weatherProvider.temperature!);
      } else {
        return _buildErrorWidget(context);
      }
    }
  }

// loading view: when data is fetching
  Widget _buildLoadingWidget(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: double.maxFinite,
        width: double.minPositive,
        child: Lottie.asset(
          'assets/lottie_animation/samsungLoading.json',
          repeat: true,
          fit: BoxFit.contain,
          height: MediaQuery.of(context).size.height * 0.8,
          width: MediaQuery.of(context).size.width * 0.8,
        ),
      ),
    );
  }

//error view: when weather is not fetched
  Widget _buildErrorWidget(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Something went wrong!',
              style: GoogleFonts.quicksand(
                textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                  height: 0,
                ),
              ),
            ),
            SizedBox(
              height: 20.sp,
            ),
            Lottie.asset(
              'assets/lottie_animation/no_internet.json', //'assets/lottie_animation/loading_hand.json',
              repeat: true,
              fit: BoxFit.contain,
              // height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width * 0.8,
            ),
            SizedBox(
              height: 20.sp,
            ),
            ElevatedButton(
              onPressed: () async {
                Provider.of<WeatherProvider>(context, listen: false)
                    .fetchWeather();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
              ),
              child: Text(
                'Try Again!',
                style: GoogleFonts.quicksand(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                    height: 0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
