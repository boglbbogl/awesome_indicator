import 'package:awesome_indicator/awesome_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExampleAwesomeFillIndicator extends StatefulWidget {
  const ExampleAwesomeFillIndicator({super.key});

  @override
  State<ExampleAwesomeFillIndicator> createState() =>
      _ExampleAwesomeFillIndicatorState();
}

class _ExampleAwesomeFillIndicatorState
    extends State<ExampleAwesomeFillIndicator> {
  final ScrollController horizontalController = ScrollController();
  final ScrollController verticalController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(26, 26, 26, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(26, 26, 26, 1),
        title: const Text(
          "Fill Indicator",
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
      body: ListView(
        children: [
          SizedBox(
            height: 700,
            child: SingleChildScrollView(
              controller: horizontalController,
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Image.asset(
                    "assets/panorama_3.jpg",
                  )
                ],
              ),
            ),
          ),
          AwesomeIndicator.fill(
            controller: horizontalController,
            gradient: LinearGradient(colors: [
              Colors.blue.shade200,
              Colors.blue.shade800,
            ]),
            background: const Color.fromRGBO(96, 96, 96, 1),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 40),
            height: 4,
            color: const Color.fromRGBO(66, 66, 66, 1),
          ),
          SizedBox(
            height: 200,
            child: Row(
              children: [
                Expanded(
                    child: SingleChildScrollView(
                  controller: verticalController,
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/panorama_2.jpg",
                      )
                    ],
                  ),
                )),
                AwesomeIndicator.fill(
                  scrollDirection: Axis.vertical,
                  controller: verticalController,
                  radius: 0,
                  color: Colors.white,
                  width: 4,
                  margin: const EdgeInsets.only(left: 4),
                  background: const Color.fromRGBO(76, 76, 76, 1),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
