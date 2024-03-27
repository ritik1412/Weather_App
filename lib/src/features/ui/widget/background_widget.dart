import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/night.png',
      fit: BoxFit.fill,
      height: double.infinity,
      width: double.infinity,
    );
  }
}
