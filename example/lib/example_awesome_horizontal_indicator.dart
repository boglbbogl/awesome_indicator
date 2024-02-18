import 'package:awesome_indicator/awesome_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExampleAwesomeHorizontalIndicator extends StatefulWidget {
  const ExampleAwesomeHorizontalIndicator({super.key});

  @override
  State<ExampleAwesomeHorizontalIndicator> createState() =>
      _ExampleAwesomeHorizontalIndicatorState();
}

class _ExampleAwesomeHorizontalIndicatorState
    extends State<ExampleAwesomeHorizontalIndicator> {
  final ScrollController imageController = ScrollController();
  final ScrollController iconController = ScrollController();
  final ScrollController panoramaController = ScrollController();

  int imageRatio = 0;
  double imagePixel = 0;

  int panoramaRatio = 0;
  double panoramaPixel = 0;

  final List<String> _images =
      List.generate(8, (index) => "assets/image_${index + 1}.jpg");

  void _imageListener(int ratio, double pixel, _) {
    setState(() {
      imageRatio = ratio;
      imagePixel = pixel;
    });
  }

  void _panoramaListener(int ratio, double pixel, _) {
    setState(() {
      panoramaRatio = ratio;
      panoramaPixel = pixel;
    });
  }

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
            height: 180,
            child: SingleChildScrollView(
              controller: iconController,
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const SizedBox(width: 12),
                  ...List.generate(
                      _icons.length ~/ 2,
                      (index) => Column(
                            children: [
                              ...List.generate(
                                2,
                                (i) => Container(
                                  margin: const EdgeInsets.only(
                                      right: 12, bottom: 10),
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      gradient: const LinearGradient(
                                          colors: [
                                            Color.fromRGBO(66, 66, 66, 1),
                                            Color.fromRGBO(86, 86, 86, 1),
                                            Color.fromRGBO(96, 96, 96, 1),
                                            Color.fromRGBO(66, 66, 66, 1),
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight)),
                                  child: Icon(
                                    _icons[index * 2 + i],
                                    color: Colors.accents[(index * 2 + i) % 15],
                                    size: 40,
                                  ),
                                ),
                              )
                            ],
                          ))
                ],
              ),
            ),
          ),
          AwesomeScrollIndicator.horizontal(
            controller: iconController,
            indicator: 0.5,
            width: MediaQuery.of(context).size.width * 0.15,
            height: 4,
            radius: 50,
            backgroundColor: Colors.pink.shade200,
            color: Colors.pink,
          ),
          _divider(),
          SizedBox(
            height: 250,
            child: SingleChildScrollView(
              controller: imageController,
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
            controller: imageController,
            isDebug: true,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            backgroundColor: const Color.fromRGBO(96, 96, 96, 1),
            color: Colors.white,
            indicator: 0.2,
            onListener: _imageListener,
          ),
          _divider(),
          SizedBox(
            height: 700,
            child: ListView(
              controller: panoramaController,
              scrollDirection: Axis.horizontal,
              children: [
                Image.asset(
                  "assets/panorama.jpg",
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
          AwesomeScrollIndicator.horizontal(
            controller: panoramaController,
            indicator: 0.5,
            height: 14,
            radius: 0,
            backgroundGradient: const LinearGradient(colors: [
              Color.fromRGBO(106, 106, 106, 1),
              Color.fromRGBO(116, 116, 116, 1),
              Color.fromRGBO(135, 135, 135, 1),
              Color.fromRGBO(96, 96, 96, 1),
              Color.fromRGBO(86, 86, 86, 1),
              Color.fromRGBO(66, 66, 66, 1),
            ]),
            indicatorGradient: LinearGradient(colors: [
              Colors.cyan.shade200,
              Colors.cyan.shade300,
              Colors.cyan.shade500,
              Colors.cyan.shade700,
              Colors.cyan.shade500,
              Colors.cyan.shade200,
            ]),
            onListener: _panoramaListener,
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Container _divider() => Container(
        margin: const EdgeInsets.symmetric(vertical: 40),
        height: 4,
        color: const Color.fromRGBO(66, 66, 66, 1),
      );

  final List<IconData> _icons = [
    Icons.search,
    Icons.settings,
    Icons.favorite,
    Icons.nat_rounded,
    Icons.earbuds_rounded,
    Icons.wifi,
    Icons.near_me_outlined,
    Icons.alarm,
    Icons.airplanemode_active_rounded,
    Icons.zoom_in_map_rounded,
    Icons.icecream_rounded,
    Icons.cloud_circle_rounded,
    Icons.arrow_circle_down_rounded,
    Icons.train_rounded,
    Icons.car_repair_rounded,
    Icons.business_center_rounded,
    Icons.build_sharp,
    Icons.photo_album_rounded,
    Icons.video_collection,
    Icons.chat_bubble_outline_outlined,
    Icons.cabin_rounded,
    Icons.dangerous_rounded,
    Icons.dark_mode_rounded,
    Icons.sunny,
    Icons.surfing_rounded,
    Icons.handshake,
    Icons.oil_barrel_rounded,
    Icons.bolt_rounded,
    Icons.ramen_dining_rounded,
    Icons.radio_outlined,
  ];
}
