import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExampleSlideHorizontal extends StatefulWidget {
  const ExampleSlideHorizontal({super.key});

  @override
  State<ExampleSlideHorizontal> createState() => _ExampleSlideHorizontalState();
}

class _ExampleSlideHorizontalState extends State<ExampleSlideHorizontal> {
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
              "Slide Indicator",
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
              Container(
                height: 200,
                color: Colors.transparent,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      const SizedBox(width: 12),
                      ...List.generate(
                          1000,
                          (index) => Column(
                                children: [
                                  ...List.generate(
                                    2,
                                    (index) => Container(
                                      margin: const EdgeInsets.only(
                                          bottom: 10, right: 10),
                                      width: 90,
                                      height: 90,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          gradient: const LinearGradient(
                                              colors: [
                                                Color.fromRGBO(
                                                    215, 215, 215, 1),
                                                Color.fromRGBO(
                                                    155, 155, 155, 1),
                                              ],
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight)),
                                    ),
                                  )
                                ],
                              )),
                      const SizedBox(width: 2),
                    ],
                  ),
                ),
              ),
              // AwesomeIndicator.fill(controller: controller)
              // AwesomeIndicator.fill(controller: controller),
              // AwesomeIndicator.fill(controller: controller),
              // AwesomeIndicator.move(controller: controller),
              // Test.test(text: "text"),
              // AwesomeIndicator.move(controller: controller),
              // AwesomeIndicator.move(controller: controller),
              // AwesomeIndicator.move(controller: controller),
              // AwesomeIndicator.move(controller: controller)
            ],
          ),
        ),
      ],
    );
  }
}
