import 'package:awesome_indicator/awesome_scroll_indicator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ExampleAwesomeIndicator(),
    );
  }
}

class ExampleAwesomeIndicator extends StatefulWidget {
  const ExampleAwesomeIndicator({super.key});

  @override
  State<ExampleAwesomeIndicator> createState() =>
      _ExampleAwesomeIndicatorState();
}

class _ExampleAwesomeIndicatorState extends State<ExampleAwesomeIndicator> {
  final ScrollController caseOneController = ScrollController();
  final ScrollController caseTwoController = ScrollController();

  double caseOnePosition = 0;
  int caseOneRatio = 0;

  double caseTwoPosition = 0;
  int caseTwoRatio = 0;

  final Color background = const Color.fromRGBO(26, 26, 26, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: const Text(
          "Scroll Indicator",
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
                        "Case 2",
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
                            "Position : ${caseTwoPosition.toStringAsFixed(2).toString()}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Color.fromRGBO(155, 155, 155, 1)),
                          ),
                          Text(
                            "Ratio : ${caseTwoRatio.toString()}",
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
                      controller: caseTwoController,
                      scrollDirection: Axis.horizontal,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ...List.generate(
                            2,
                            (i) => Row(
                              children: [
                                const SizedBox(width: 20),
                                ...List.generate(
                                  50,
                                  (index) => Container(
                                    width: 55,
                                    height: 55,
                                    margin: const EdgeInsets.only(right: 8),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.accents[index % 15]
                                          .withOpacity(0.8),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )),
              ],
            ),
          ),
          AwesomeScrollIndicator(
            width: MediaQuery.of(context).size.width * 0.3,
            height: 6,
            controller: caseTwoController,
            color: Colors.amber,
            border: Border.all(color: Colors.amber),
            indicator: 0.5,
            backgroud: const Color.fromRGBO(95, 95, 95, 1),
            onListener: (int ratio, double position) {
              setState(() {
                caseTwoPosition = position;
                caseTwoRatio = ratio;
              });
            },
          ),
        ],
      ),
    );
  }
}
