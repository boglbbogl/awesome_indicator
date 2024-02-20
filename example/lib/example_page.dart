import 'package:example/example_slide_horizontal.dart';
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
            "Slide",
            [
              _item(
                  "horizontal",
                  () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => const ExampleSlideHorizontal()))),
              _item(
                  "vertical",
                  () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => const ExampleSlideHorizontal()))),
            ],
          ),
          _divider(),
          _content(
            "Page",
            [
              _item("name", () => null),
              _item("name", () => null),
            ],
          ),
        ],
      ),
    );
  }

  Container _divider() => Container(
        margin: const EdgeInsets.only(bottom: 12, top: 24),
        height: 4,
        color: const Color.fromRGBO(66, 66, 66, 1),
      );

  GestureDetector _item(
    String name,
    Function() onTap,
  ) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.mediumImpact();
        onTap();
      },
      child: Container(
        color: Colors.transparent,
        margin: const EdgeInsets.only(left: 12, top: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.white,
            )
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
      margin: const EdgeInsets.only(top: 24, bottom: 18),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w900,
              color: Colors.white,
              fontSize: 22,
            ),
          ),
          ...children,
        ],
      ),
    );
  }
}
