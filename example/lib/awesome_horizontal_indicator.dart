import 'package:awesome_indicator/awesome_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AwesomeHorizontalIndicator extends StatefulWidget {
  const AwesomeHorizontalIndicator({super.key});

  @override
  State<AwesomeHorizontalIndicator> createState() =>
      _AwesomeHorizontalIndicatorState();
}

class _AwesomeHorizontalIndicatorState
    extends State<AwesomeHorizontalIndicator> {
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
          "Horizontal Indicator",
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
            height: 250,
            child: SingleChildScrollView(
              controller: controller,
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const SizedBox(width: 20),
                  ..._images.map(
                    (e) => Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          e,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                ],
              ),
            ),
          ),
          AwesomeScrollIndicator.horizontal(
            controller: controller,
            isDebug: true,
          ),
        ],
      ),
    );
  }
}
