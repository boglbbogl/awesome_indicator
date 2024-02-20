import 'package:example/example_awesome_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExamplePage extends StatelessWidget {
  const ExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(26, 26, 26, 1),
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: const Color.fromRGBO(26, 26, 26, 1),
        title: const Text(
          "Awesome Indicator",
          style: TextStyle(
            fontWeight: FontWeight.w900,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        children: [
          _content(
            "Indicator",
            [
              _button(
                "Indicator",
                () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => const ExampleAwesomeIndicator())),
              ),
            ],
          ),
        ],
      ),
    );
  }

  GestureDetector _button(
    String content,
    Function() onTap,
  ) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.mediumImpact();
        onTap();
      },
      child: Container(
        height: 50,
        color: Colors.transparent,
        margin: const EdgeInsets.only(top: 0),
        padding: const EdgeInsets.only(left: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              content,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(225, 225, 225, 1),
                fontSize: 16,
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              color: Color.fromRGBO(225, 225, 225, 1),
            ),
          ],
        ),
      ),
    );
  }

  Container _content(
    String title,
    List<Widget> children,
  ) {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w900,
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 12),
          ...children,
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
