import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExampleSlideVertical extends StatefulWidget {
  const ExampleSlideVertical({super.key});

  @override
  State<ExampleSlideVertical> createState() => _ExampleSlideVerticalState();
}

class _ExampleSlideVerticalState extends State<ExampleSlideVertical> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(26, 26, 26, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(26, 26, 26, 1),
        title: const Text(
          "Slide Vertical",
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
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 12),
                width: (MediaQuery.of(context).size.width / 2) - 16,
                height: (MediaQuery.of(context).size.width / 2) - 40,
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: const Color.fromRGBO(115, 115, 115, 1),
                          )),
                      width: (MediaQuery.of(context).size.width / 2) - 56,
                      height: (MediaQuery.of(context).size.width / 2) - 40,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            ...List.generate(
                                100, (index) => Text(index.toString()))
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 40,
                      height: (MediaQuery.of(context).size.width / 2) - 40,
                      color: Colors.cyan,
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 12),
                width: (MediaQuery.of(context).size.width / 2) - 16,
                height: (MediaQuery.of(context).size.width / 2) - 40,
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: const Color.fromRGBO(115, 115, 115, 1),
                          )),
                      width: (MediaQuery.of(context).size.width / 2) - 56,
                      height: (MediaQuery.of(context).size.width / 2) - 40,
                      child: SingleChildScrollView(
                        child: Column(),
                      ),
                    ),
                    Container(
                      width: 40,
                      height: (MediaQuery.of(context).size.width / 2) - 40,
                      color: Colors.cyan,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
