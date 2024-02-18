import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExampleAwesomeIndicatorMode extends StatefulWidget {
  const ExampleAwesomeIndicatorMode({super.key});

  @override
  State<ExampleAwesomeIndicatorMode> createState() =>
      _ExampleAwesomeIndicatorModeState();
}

class _ExampleAwesomeIndicatorModeState
    extends State<ExampleAwesomeIndicatorMode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(26, 26, 26, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(26, 26, 26, 1),
        title: const Text(
          "Awesome Indicator Mode",
          style: TextStyle(
            fontWeight: FontWeight.w900,
            color: Colors.white,
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            HapticFeedback.mediumImpact();
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
