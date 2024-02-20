import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExampleAwesomeIndicator extends StatefulWidget {
  const ExampleAwesomeIndicator({super.key});

  @override
  State<ExampleAwesomeIndicator> createState() =>
      _ExampleAwesomeIndicatorState();
}

class _ExampleAwesomeIndicatorState extends State<ExampleAwesomeIndicator> {
  final ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: const Color.fromRGBO(26, 26, 26, 1),
          appBar: AppBar(
            backgroundColor: const Color.fromRGBO(26, 26, 26, 1),
            title: const Text(
              "Awesome Indicator",
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
              SizedBox(height: MediaQuery.of(context).padding.bottom + 30),
            ],
          ),
        ),
        Positioned(
          bottom: MediaQuery.of(context).padding.bottom,
          child: SizedBox(
            height: 30,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              controller: controller,
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const SizedBox(width: 20),
                  ...List.generate(
                    3000,
                    (index) => Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(colors: [
                          Color.fromRGBO(96, 96, 96, 1),
                          Color.fromRGBO(116, 116, 116, 1),
                          Color.fromRGBO(66, 66, 66, 1),
                        ]),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
