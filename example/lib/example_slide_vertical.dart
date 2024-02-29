import 'package:awesome_indicator/awesome_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExampleSlideVertical extends StatefulWidget {
  const ExampleSlideVertical({super.key});

  @override
  State<ExampleSlideVertical> createState() => _ExampleSlideVerticalState();
}

class _ExampleSlideVerticalState extends State<ExampleSlideVertical> {
  final ScrollController firstItemController = ScrollController();
  final ScrollController secondItemController = ScrollController();
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
      _currentRatio = ratio;
      _currentPosition = pixel;
    });
  }

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
              _item(
                controller: firstItemController,
                widget: AwesomeIndicator.move(
                  controller: firstItemController,
                  margin: const EdgeInsets.all(12),
                  width: 12,
                  radius: 8,
                  scrollDirection: Axis.vertical,
                  indicator: 0.5,
                  color: const Color.fromRGBO(235, 235, 235, 1),
                  backgroundGradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromRGBO(76, 76, 76, 1),
                        Color.fromRGBO(126, 126, 126, 1),
                      ]),
                ),
              ),
              _item(
                controller: secondItemController,
                widget: AwesomeIndicator.fill(
                  controller: secondItemController,
                  margin: const EdgeInsets.all(12),
                  width: 12,
                  radius: 8,
                  scrollDirection: Axis.vertical,
                  background: const Color.fromRGBO(66, 66, 66, 1),
                  gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.amber,
                        Colors.cyan,
                        Colors.blue,
                        Colors.red,
                        Colors.pink,
                      ]),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 48),
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
          Container(
            height: 300,
            color: Colors.transparent,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: SizedBox(
                    width: 200,
                    height: 300,
                    child: ListView(
                      controller: controller,
                      children: [
                        ...List.generate(
                          150,
                          (index) => Container(
                            width: 100,
                            height: 100,
                            alignment: Alignment.center,
                            color:
                                Color.fromRGBO(76, 76 + index, 76 + index, 1),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                AwesomeIndicator.fill(
                  onListener: _onListener,
                  scrollDirection: Axis.vertical,
                  controller: controller,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  backgroundGradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromRGBO(115, 115, 115, 1),
                        Color.fromRGBO(175, 175, 175, 1),
                        Color.fromRGBO(115, 115, 115, 1),
                      ]),
                  gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromRGBO(126, 126, 126, 1),
                        Color.fromRGBO(76, 216, 216, 1),
                      ]),
                ),
                AwesomeIndicator.move(
                  scrollDirection: Axis.vertical,
                  controller: controller,
                  indicator: 0.5,
                  height: 50,
                  width: 4,
                  background: const Color.fromRGBO(96, 96, 96, 1),
                  color: const Color.fromRGBO(215, 215, 215, 1),
                ),
                AwesomeIndicator.move(
                  scrollDirection: Axis.vertical,
                  controller: controller,
                  width: 20,
                  radius: 0,
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  background: const Color.fromRGBO(76, 76, 76, 1),
                  color: const Color.fromRGBO(76, 236, 236, 1),
                ),
                AwesomeIndicator.fill(
                  scrollDirection: Axis.vertical,
                  controller: controller,
                  width: 16,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 24),
                  background: Colors.purple.shade200,
                  color: Colors.purple,
                ),
                AwesomeIndicator.fill(
                  scrollDirection: Axis.vertical,
                  controller: controller,
                  width: 6,
                  height: 150,
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  background: Colors.amber.shade100,
                  color: Colors.amber.shade700,
                ),
                AwesomeIndicator.move(
                  scrollDirection: Axis.vertical,
                  controller: controller,
                  width: 12,
                  height: 180,
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  backgroundGradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.amber.shade100,
                        Colors.amber.shade500,
                      ]),
                  color: Colors.deepOrange,
                ),
                AwesomeIndicator.fill(
                  scrollDirection: Axis.vertical,
                  controller: controller,
                  width: 24,
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  background: const Color.fromRGBO(155, 155, 155, 1),
                  gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.orange,
                        Colors.green,
                        Colors.blue,
                      ]),
                ),
                AwesomeIndicator.move(
                  scrollDirection: Axis.vertical,
                  controller: controller,
                  indicator: 0.6,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 48),
                  background: const Color.fromRGBO(115, 115, 115, 1),
                  color: const Color.fromRGBO(215, 215, 215, 1),
                ),
              ],
            ),
          )
        ],
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

  Container _item({
    required ScrollController controller,
    required Widget widget,
  }) {
    return Container(
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
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            child: SingleChildScrollView(
              controller: controller,
              child: Column(
                children: [
                  ...List.generate(
                      300,
                      (index) => Container(
                            height: 35,
                            width: (MediaQuery.of(context).size.width / 2) - 56,
                            color: Colors.accents[index % 15].withOpacity(0.6),
                          )),
                ],
              ),
            ),
          ),
          widget,
        ],
      ),
    );
  }
}
