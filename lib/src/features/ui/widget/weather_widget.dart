import 'dart:developer';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import '../../models/astro_model.dart';
import '../../models/current_model.dart';
import '../../models/day_model.dart';
import '../../models/location_model.dart';
import '../../models/temperatures_model.dart';
import 'background_widget.dart';
import 'scale_widget.dart';

class WeatherWidget extends StatefulWidget {
  const WeatherWidget({
    super.key,
    required this.temperatures,
  });
  final Temperatures temperatures;
  @override
  State<WeatherWidget> createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ValueNotifier<bool> scaleIsDegree = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    final Location? location = widget.temperatures.location;
    final Current? current = widget.temperatures.current;
    final DayModel? day = widget.temperatures.forecast?.forecastday?[0].day;
    final AstroModel? astro =
        widget.temperatures.forecast?.forecastday?[0].astro;
    const String degreeSymbol = '\u00B0';
    return Stack(
      children: <Widget>[
        const BackgroundWidget(),
        SafeArea(
          child: Scaffold(
            key: _scaffoldKey,
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              scrolledUnderElevation: 0,
              actions: <Widget>[
                ScaleWidget(
                  scaleIsDegree: scaleIsDegree,
                ),
              ],
            ),
            body: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: 12.sp,
                vertical: 12.sp,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    location?.name ?? 'NA',
                    style: GoogleFonts.quicksand(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 40.sp,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                        height: 0,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12.sp,
                  ),
                  Text(
                    epochToDatetime(epoch: current?.last_updated) ?? 'NA',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(
                    height: 120.sp,
                  ),
                  ValueListenableBuilder<bool>(
                    valueListenable: scaleIsDegree,
                    builder: (BuildContext context, bool tabValue, __) {
                      return Text(
                        tabValue
                            ? '${current?.temp_c.toString() ?? 'NA'}$degreeSymbol'
                            : '${current?.temp_f.toString() ?? 'NA'}$degreeSymbol',
                        style: GoogleFonts.quicksand(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 96.sp,
                            overflow: TextOverflow.ellipsis,
                            height: 0.8,
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 16.sp,
                  ),
                  Row(
                    children: <Widget>[
                      if (current?.condition?.icon != null)
                        Image.network(
                          'https:${current!.condition!.icon!}',
                          height: 40.sp,
                          width: 40.sp,
                          color: Colors.white,
                          errorBuilder: (_, Object error, __) {
                            log(error.toString());
                            return const SizedBox.shrink();
                          },
                        ),
                      SizedBox(
                        width: 8.sp,
                      ),
                      Text(
                        current?.condition?.text ?? 'NA',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 44.sp,
                  ),
                  Divider(
                    thickness: 2.sp,
                    color: Colors.white24,
                  ),
                  SizedBox(
                    height: 16.sp,
                  ),
                  Table(
                    children: <TableRow>[
                      TableRow(
                        children: <Widget>[
                          if (current?.wind_kph != null)
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Icon(
                                  CupertinoIcons.wind_snow,
                                  size: 24.sp,
                                  color: Colors.white,
                                ),
                                Text(
                                  ' Wind',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                          if (day?.daily_chance_of_rain != null)
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Icon(
                                  CupertinoIcons.cloud_hail,
                                  size: 24.sp,
                                  color: Colors.white,
                                ),
                                Text(
                                  ' Rain',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                          if (current?.humidity != null)
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Icon(
                                  CupertinoIcons.drop_triangle,
                                  size: 24.sp,
                                  color: Colors.white,
                                ),
                                Text(
                                  ' Humidity',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12.sp,
                  ),
                  Table(
                    children: <TableRow>[
                      TableRow(
                        children: <Widget>[
                          if (current?.wind_kph != null)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  current!.wind_kph.toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 28.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  'km/h',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          if (day?.daily_chance_of_rain != null)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  day!.daily_chance_of_rain.toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 28.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  '%',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          if (current?.humidity != null)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  current!.humidity.toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 28.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  '%',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8.sp,
                  ),
                  Table(
                    children: <TableRow>[
                      TableRow(
                        children: <Widget>[
                          if (current?.wind_kph != null)
                            Stack(
                              children: <Widget>[
                                getWidthWidget(
                                  givenValue: current!.wind_kph!,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(24.sp),
                                    color: Colors.white24,
                                  ),
                                  height: 4.sp,
                                  width: 80.sp,
                                ),
                              ],
                            ),
                          if (day?.daily_chance_of_rain != null)
                            Stack(
                              children: <Widget>[
                                getWidthWidget(
                                  givenValue:
                                      day!.daily_chance_of_rain!.toDouble(),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(24.sp),
                                    color: Colors.white24,
                                  ),
                                  height: 4.sp,
                                  width: 80.sp,
                                ),
                              ],
                            ),
                          if (current?.humidity != null)
                            Stack(
                              children: <Widget>[
                                getWidthWidget(
                                  givenValue: current!.humidity!.toDouble(),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(24.sp),
                                    color: Colors.white24,
                                  ),
                                  height: 4.sp,
                                  width: 80.sp,
                                ),
                              ],
                            ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24.sp,
                  ),
                  Divider(
                    thickness: 2.sp,
                    color: Colors.white24,
                  ),
                  SizedBox(
                    height: 24.sp,
                  ),
                  if (current?.air_quality != null)
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () async {
                        dialogBuilder(
                          context: context,
                          map: current!.air_quality!,
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.air,
                                size: 24.sp,
                                color: Colors.white,
                              ),
                              Text(
                                ' Air Quality',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24.sp),
                            child: Text(
                              aqi(
                                index: current?.air_quality?['us-epa-index'] ??
                                    100,
                              ),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 12.sp,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24.sp),
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50.sp),
                                    color: Colors.transparent,
                                  ),
                                  height: 12.sp,
                                  width: MediaQuery.of(context).size.width - 72,
                                ),
                                Positioned(
                                  top: 2.sp,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.horizontal(
                                        left: Radius.circular(50.sp),
                                      ),
                                      color: Colors.green,
                                    ),
                                    width: (MediaQuery.of(context).size.width -
                                            72) /
                                        6,
                                    height: 8.sp,
                                  ),
                                ),
                                Positioned(
                                  top: 2.sp,
                                  left:
                                      (MediaQuery.of(context).size.width - 72) /
                                          6,
                                  child: Container(
                                    color: Colors.lightGreen,
                                    width: (MediaQuery.of(context).size.width -
                                            72) /
                                        6,
                                    height: 8.sp,
                                  ),
                                ),
                                Positioned(
                                  top: 2.sp,
                                  left:
                                      (MediaQuery.of(context).size.width - 72) /
                                          3,
                                  child: Container(
                                    color: Colors.yellow,
                                    width: (MediaQuery.of(context).size.width -
                                            72) /
                                        6,
                                    height: 8.sp,
                                  ),
                                ),
                                Positioned(
                                  top: 2.sp,
                                  left:
                                      (MediaQuery.of(context).size.width - 72) /
                                          2,
                                  child: Container(
                                    color: Colors.orange,
                                    width: (MediaQuery.of(context).size.width -
                                            72) /
                                        6,
                                    height: 8.sp,
                                  ),
                                ),
                                Positioned(
                                  top: 2.sp,
                                  left:
                                      (MediaQuery.of(context).size.width - 72) *
                                          2 /
                                          3,
                                  child: Container(
                                    color: Colors.red,
                                    width: (MediaQuery.of(context).size.width -
                                            72) /
                                        6,
                                    height: 8.sp,
                                  ),
                                ),
                                Positioned(
                                  top: 2.sp,
                                  right: 0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF800000),
                                      borderRadius: BorderRadius.horizontal(
                                        right: Radius.circular(100.sp),
                                      ),
                                    ),
                                    width: (MediaQuery.of(context).size.width -
                                            80) /
                                        6,
                                    height: 8.sp,
                                  ),
                                ),
                                if (current?.air_quality?['us-epa-index'] !=
                                    null)
                                  Positioned(
                                    left: ((MediaQuery.of(context).size.width -
                                                72) /
                                            12) +
                                        ((current?.air_quality?[
                                                    'us-epa-index'] -
                                                1) *
                                            (MediaQuery.of(context).size.width -
                                                72) /
                                            6),
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                      height: 12.sp,
                                      width: 12.sp,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 8.sp,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24.sp),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'see more',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.sp,
                                  ),
                                ),
                                Icon(
                                  Icons.chevron_right_rounded,
                                  size: 24.sp,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 24.sp,
                          ),
                          Divider(
                            thickness: 2.sp,
                            color: Colors.white24,
                          ),
                        ],
                      ),
                    ),
                  SizedBox(
                    height: 8.sp,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      if (astro?.sunrise != null && astro?.sunset != null)
                        Padding(
                          padding: EdgeInsets.only(top: 18.sp),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  Lottie.asset(
                                    'assets/lottie_animation/sunrise.json',
                                    animate: true,
                                    repeat: true,
                                    fit: BoxFit.contain,
                                    height: 150,
                                    width: 150,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.wb_twilight_outlined,
                                        size: 24.sp,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        ' Sunrise',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 12.sp,
                                      ),
                                      Text(
                                        astro!.sunrise!,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Positioned(
                                    top: 80.sp,
                                    child: Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.nights_stay,
                                          size: 24.sp,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          ' Sunset',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 12.sp,
                                        ),
                                        Text(
                                          astro.sunset!,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8.sp,
                              ),
                            ],
                          ),
                        ),
                      if (current?.uv != null)
                        Container(
                          padding: EdgeInsets.all(20.sp),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.wb_sunny_outlined,
                                    size: 24.sp,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    ' UV Index',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8.sp,
                              ),
                              Row(
                                children: <Widget>[
                                  Text(
                                    current!.uv!.round().toString(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 28.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    '-${uv(index: current.uv!.round())}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8.sp,
                              ),
                              Stack(
                                children: <Widget>[
                                  SizedBox(
                                    height: 10.sp,
                                    width: 108.sp,
                                  ),
                                  Positioned(
                                    top: 3.sp,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          50.sp,
                                        ),
                                        gradient: const LinearGradient(
                                          colors: <Color>[
                                            Colors.green,
                                            Colors.yellow,
                                            Colors.orange,
                                            Colors.red,
                                            Colors.purple,
                                          ],
                                        ),
                                      ),
                                      height: 4.sp,
                                      width: 108.sp,
                                    ),
                                  ),
                                  Positioned(
                                    top: 1.sp,
                                    left: (((current.uv! - 1) / 10) * 100).sp,
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                      height: 8.sp,
                                      width: 8.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                  SizedBox(
                    height: 20.sp,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> dialogBuilder({
    required BuildContext context,
    required Map<String, dynamic> map,
  }) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        final List<Widget> children = <Widget>[];

        for (final MapEntry<String, dynamic> entry in map.entries) {
          children.add(
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '${entry.key} :',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  '${entry.value}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          );
        }

        return BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 10.0,
            sigmaY: 10.0,
          ),
          child: AlertDialog(
            backgroundColor: Colors.transparent,
            title: const Text(
              'Air Quality (μg/m3)',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: children,
            ),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  String? epochToDatetime({String? epoch}) {
    if (epoch == null) {
      return null;
    }

    DateTime? datetime;

    try {
      datetime = DateTime.parse(epoch);
    } catch (e) {
      return null;
    }

    final String date = DateFormat('yy MMM').format(datetime);
    final String exactDate = DateFormat('dd').format(datetime);
    final String day = DateFormat.EEEE().format(datetime);

    final String time12hr = DateFormat.jm().format(datetime).toLowerCase();

    const String mdash = '\u2014';

    return '$time12hr$mdash$day, $date\'$exactDate';
  }

  Container getWidthWidget({
    double maxPossibleValue = 100.0,
    required double givenValue,
  }) {
    final Color color;
    final double range = (givenValue / maxPossibleValue) * 80.0;
    if (range > 66.6) {
      color = Colors.red;
    } else if (range > 33.3 && range <= 66.6) {
      color = Colors.amber;
    } else {
      color = Colors.green;
    }
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.sp),
        color: color,
      ),
      height: 4.sp,
      width: range.sp,
    );
  }

  String aqi({required int index}) {
    switch (index) {
      case 1:
        return '1- Good';
      case 2:
        return '2- Moderate';
      case 3:
        return '3- Unhealthy for Sensitive Groups';
      case 4:
        return '4- Unhealthy';
      case 5:
        return '5- Very Unhealthy';
      case 6:
        return '6- Hazardous';
      default:
        return 'Unknown';
    }
  }

  String uv({required int index}) {
    if (index >= 0 && index <= 2) {
      return 'low';
    } else if (index >= 3 && index <= 5) {
      return 'Moderate';
    } else if (index >= 6 && index <= 7) {
      return 'High';
    } else if (index >= 8 && index <= 10) {
      return 'Very high';
    } else if (index >= 11) {
      return 'Extreme';
    } else {
      return 'Unknow';
    }
  }
}
