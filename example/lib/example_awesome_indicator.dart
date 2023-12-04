import 'package:awesome_indicator/awesome_scroll_indicator.dart';
import 'package:flutter/material.dart';

class ExampleAwesomeIndicator extends StatefulWidget {
  const ExampleAwesomeIndicator({super.key});

  @override
  State<ExampleAwesomeIndicator> createState() =>
      _ExampleAwesomeIndicatorState();
}

class _ExampleAwesomeIndicatorState extends State<ExampleAwesomeIndicator> {
  final ScrollController caseOneController = ScrollController();

  double caseOnePosition = 0;
  int caseOneRatio = 0;

  final Color background = const Color.fromRGBO(26, 26, 26, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: const Text(
          "Slider Indicator",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 28, color: Colors.white),
        ),
        backgroundColor: background,
      ),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 24),
            height: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  height: 50,
                  color: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Case 1",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Position : ${caseOnePosition.toStringAsFixed(2).toString()}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Color.fromRGBO(155, 155, 155, 1)),
                          ),
                          Text(
                            "Ratio : ${caseOneRatio.toString()}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Color.fromRGBO(155, 155, 155, 1)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                    height: 150,
                    child: SingleChildScrollView(
                      controller: caseOneController,
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          const SizedBox(width: 20),
                          ...List.generate(
                            100,
                            (index) => Container(
                              width: 150,
                              height: 150,
                              margin: const EdgeInsets.only(right: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color:
                                    Colors.accents[index % 15].withOpacity(0.8),
                              ),
                            ),
                          )
                        ],
                      ),
                    )),
              ],
            ),
          ),
          const SizedBox(height: 24),
          AwesomeScrollIndicator(
            width: MediaQuery.of(context).size.width - 40,
            controller: caseOneController,
            color: Colors.white,
            indicator: 0.35,
            backgroud: const Color.fromRGBO(95, 95, 95, 1),
            onListener: (int ratio, double position) {
              setState(() {
                caseOnePosition = position;
                caseOneRatio = ratio;
              });
            },
          ),
        ],
      ),
    );
  }
}
