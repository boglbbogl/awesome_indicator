import 'package:awesome_indicator/awesome_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VerticalIndicator extends StatefulWidget {
  const VerticalIndicator({super.key});

  @override
  State<VerticalIndicator> createState() => _VerticalIndicatorState();
}

class _VerticalIndicatorState extends State<VerticalIndicator> {
  final ScrollController controller = ScrollController();
  final Color background = const Color.fromRGBO(26, 26, 26, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          "Vertical Indicator",
          style: TextStyle(fontWeight: FontWeight.w900, color: Colors.white),
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
        backgroundColor: background,
        actions: [Icon(Icons.celebration)],
      ),
      body: AwesomeVerticalIndicator(
          controller: controller,
          child: CustomScrollView(
            controller: controller,
            slivers: [
              SliverList.builder(
                // itemCount: 100,
                itemBuilder: (context, index) => Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        index.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        index.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
