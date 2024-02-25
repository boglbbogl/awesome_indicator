import 'package:awesome_indicator/awesome_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExampleSlideHorizontal extends StatefulWidget {
  const ExampleSlideHorizontal({super.key});

  @override
  State<ExampleSlideHorizontal> createState() => _ExampleSlideHorizontalState();
}

class _ExampleSlideHorizontalState extends State<ExampleSlideHorizontal> {
  final ScrollController controller = ScrollController();

  double _maxScrollExtent = 0;
  double _currentPosition = 0;
  int _currentRatio = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        _maxScrollExtent = controller.position.maxScrollExtent;
      });
    });
  }

  void _onListener(int ratio, double pixel, _) {
    setState(() {
      _currentPosition = pixel;
      _currentRatio = ratio;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: const Color.fromRGBO(26, 26, 26, 1),
          appBar: AppBar(
            backgroundColor: const Color.fromRGBO(26, 26, 26, 1),
            title: const Text(
              "Slide Indicator",
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
              _scrollWidget(),
              Container(
                margin: const EdgeInsets.only(
                    left: 20, right: 20, top: 12, bottom: 24),
                color: Colors.transparent,
                child: Column(
                  children: [
                    _scrollForm("MaxScrollExtent", _maxScrollExtent.toString()),
                    _scrollForm(
                        "CurrentPosition", _currentPosition.toStringAsFixed(3)),
                    _scrollForm("CurrentRatio", _currentRatio.toString()),
                  ],
                ),
              ),
              AwesomeIndicator.fill(
                controller: controller,
                onListener: _onListener,
                width: MediaQuery.of(context).size.width - 40,
                margin: const EdgeInsets.only(bottom: 12),
                background: Colors.white,
                color: Colors.cyan,
                height: 12,
              ),
              AwesomeIndicator.move(
                width: MediaQuery.of(context).size.width - 40,
                controller: controller,
                margin: const EdgeInsets.only(bottom: 12),
                height: 12,
                background: const Color.fromRGBO(95, 95, 95, 1),
                color: Colors.white,
              ),
              // AwesomeIndicator.fill(controller: controller),
              // AwesomeIndicator.fill(controller: controller),
              // AwesomeIndicator.move(controller: controller),
              // Test.test(text: "text"),
              // AwesomeIndicator.move(controller: controller),
              // AwesomeIndicator.move(controller: controller),
              // AwesomeIndicator.move(controller: controller),
              // AwesomeIndicator.move(controller: controller)
            ],
          ),
        ),
      ],
    );
  }

  Container _scrollWidget() {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      height: 200,
      color: Colors.transparent,
      child: SingleChildScrollView(
        controller: controller,
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            const SizedBox(width: 12),
            ...List.generate(
                100,
                (index) => Column(
                      children: [
                        ...List.generate(
                          2,
                          (i) => Container(
                            margin:
                                const EdgeInsets.only(bottom: 10, right: 10),
                            width: 90,
                            height: 90,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              gradient: const LinearGradient(
                                  colors: [
                                    Color.fromRGBO(215, 215, 215, 1),
                                    Color.fromRGBO(155, 155, 155, 1),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              (index * 2 + i).toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.black26),
                            ),
                          ),
                        )
                      ],
                    )),
            const SizedBox(width: 2),
          ],
        ),
      ),
    );
  }

  Row _scrollForm(String title, String current) {
    return Row(
      children: [
        SizedBox(
            width: 150,
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.white,
              ),
            )),
        Text(
          current,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
