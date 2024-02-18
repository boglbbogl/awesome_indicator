import 'package:awesome_indicator/awesome_scroll_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExampleAwesomeVerticalIndicator extends StatefulWidget {
  const ExampleAwesomeVerticalIndicator({super.key});

  @override
  State<ExampleAwesomeVerticalIndicator> createState() =>
      _ExampleAwesomeVerticalIndicatorState();
}

class _ExampleAwesomeVerticalIndicatorState
    extends State<ExampleAwesomeVerticalIndicator> {
  final ScrollController listController = ScrollController();
  final ScrollController gridController = ScrollController();

  final List<String> _images =
      List.generate(8, (index) => "assets/image_${index + 1}.jpg");

  final List<IconData> _icons = List.generate(87, (i) => IconData(i + 57347));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(26, 26, 26, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(26, 26, 26, 1),
        title: const Text(
          "Vertical Indicator",
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
            height: 300,
            child: Row(
              children: [
                Expanded(
                    child: SingleChildScrollView(
                  controller: listController,
                  child: Column(
                    children: [
                      ..._images.map(
                        (e) => Image.asset(
                          e,
                          width: MediaQuery.of(context).size.width - 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                )),
                AwesomeScrollIndicator.vertical(
                  controller: listController,
                  margin: const EdgeInsets.only(right: 12),
                  backgroundColor: Colors.red.shade200,
                  indicatorGradient: LinearGradient(colors: [
                    Colors.pink.shade300,
                    Colors.pink.shade400,
                    Colors.pink.shade500,
                    Colors.pink.shade600,
                    Colors.pink.shade400,
                    Colors.pink.shade300,
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                  width: 12,
                  height: 250,
                ),
              ],
            ),
          ),
          _divider(),
          SizedBox(
            height: 600,
            child: Row(
              children: [
                const SizedBox(width: 12),
                Expanded(
                  child: GridView.builder(
                      controller: gridController,
                      itemCount: _icons.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 4,
                        mainAxisSpacing: 4,
                      ),
                      itemBuilder: (context, index) => Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                gradient: const LinearGradient(
                                    colors: [
                                      Colors.white10,
                                      Colors.white12,
                                      Colors.white12,
                                      Colors.white24,
                                      Colors.white24,
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight)),
                            child: Icon(
                              _icons[index],
                              size: 40,
                            ),
                          )),
                ),
                AwesomeScrollIndicator.vertical(
                  controller: gridController,
                  indicator: 0.15,
                  margin: const EdgeInsets.only(left: 8, right: 12),
                  color: Colors.white.withOpacity(0.9),
                  backgroundColor: const Color.fromRGBO(135, 135, 135, 1),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Container _divider() => Container(
        margin: const EdgeInsets.symmetric(vertical: 40),
        height: 4,
        color: const Color.fromRGBO(66, 66, 66, 1),
      );
}
