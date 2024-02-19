import 'package:awesome_indicator/awesome_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExampleAwesomeFillIndicator extends StatefulWidget {
  const ExampleAwesomeFillIndicator({super.key});

  @override
  State<ExampleAwesomeFillIndicator> createState() =>
      _ExampleAwesomeFillIndicatorState();
}

class _ExampleAwesomeFillIndicatorState
    extends State<ExampleAwesomeFillIndicator> {
  final ScrollController horizontalController = ScrollController();
  final ScrollController verticalController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(26, 26, 26, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(26, 26, 26, 1),
        title: const Text(
          "Fill Indicator",
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
            height: 300,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...List.generate(1000, (index) => Text(index.toString()))
                ],
              ),
            ),
          ),
          AwesomeScrollIndicator.fill(
            controller: horizontalController,
          ),
          Container(
            height: 300,
            child: Row(
              children: [
                Expanded(
                    child: ListView.builder(
                        controller: verticalController,
                        itemCount: 1000,
                        itemBuilder: (context, index) =>
                            Text(index.toString()))),
                AwesomeScrollIndicator.fill(
                  controller: verticalController,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
