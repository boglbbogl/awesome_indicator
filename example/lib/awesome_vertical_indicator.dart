import 'package:awesome_indicator/awesome_scroll_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AwesomeVerticalIndicator extends StatefulWidget {
  const AwesomeVerticalIndicator({super.key});

  @override
  State<AwesomeVerticalIndicator> createState() =>
      _AwesomeVerticalIndicatorState();
}

class _AwesomeVerticalIndicatorState extends State<AwesomeVerticalIndicator> {
  final ScrollController controller = ScrollController();

  final List<String> _images =
      List.generate(8, (index) => "assets/image_${index + 1}.jpg");
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
                  controller: controller,
                  child: Column(
                    children: [
                      ..._images.map(
                        (e) => Image.asset(
                          e,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                )),
                AwesomeScrollIndicator.vertical(
                  controller: controller,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
