import 'package:example/horizontal_indicator.dart';
import 'package:example/vertical_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(26, 26, 26, 1),
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: const Color.fromRGBO(26, 26, 26, 1),
        title: const Text(
          "Awesome Indicator",
          style: TextStyle(fontWeight: FontWeight.w900, color: Colors.white),
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 24),
          _button(
            content: "awesome_horizontal_indicator",
            onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const HorizontalIndicator())),
          ),
          _button(
            content: "awesome_vertical_indicator",
            onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const VerticalIndicator())),
          )
        ],
      ),
    );
  }

  GestureDetector _button({
    required String content,
    required Function() onTap,
  }) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.mediumImpact();
        onTap();
      },
      child: Container(
        margin: const EdgeInsets.only(top: 12, bottom: 24, left: 12, right: 12),
        padding: const EdgeInsets.only(left: 8, right: 8),
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color.fromRGBO(96, 96, 96, 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                content,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
