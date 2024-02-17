import 'package:flutter/material.dart';

class AwesomeScrollIndicator extends StatelessWidget {
  const AwesomeScrollIndicator({
    super.key,
    required this.scrollDirection,
    required this.controller,
    this.width,
    this.height,
    this.indicator,
    this.backgroundColor,
    this.color,
    this.radius,
  });

  const AwesomeScrollIndicator.vertical({
    super.key,
    required this.controller,
    this.width,
    this.height,
    this.indicator,
    this.backgroundColor,
    this.color,
    this.radius,
  }) : scrollDirection = Axis.vertical;

  const AwesomeScrollIndicator.horizontal({
    super.key,
    required this.controller,
    this.width,
    this.height,
    this.indicator,
    this.backgroundColor,
    this.color,
    this.radius,
  }) : scrollDirection = Axis.horizontal;

  final Axis scrollDirection;
  final ScrollController controller;
  final double? width;
  final double? height;
  final double? indicator;
  final Color? backgroundColor;
  final Color? color;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) => _Widget(
        scrollDirection: scrollDirection,
        controller: controller,
        width: width ?? constraints.maxWidth,
        height: height ?? constraints.maxHeight,
        indicator: indicator ?? 0.35,
        backgroundColor:
            backgroundColor ?? const Color.fromRGBO(125, 125, 125, 1),
        color: color ?? Colors.black,
        radius: radius ?? 8,
      ),
    );
  }
}

class _Widget extends StatefulWidget {
  final Axis scrollDirection;
  final ScrollController controller;
  final double width;
  final double height;
  final double? indicator;
  final Color? backgroundColor;
  final Color? color;
  final double? radius;
  const _Widget({
    required this.scrollDirection,
    required this.controller,
    required this.width,
    required this.height,
    required this.indicator,
    required this.backgroundColor,
    required this.color,
    required this.radius,
  });

  @override
  State<_Widget> createState() => __WidgetState();
}

class __WidgetState extends State<_Widget> {
  double _width = 0;
  double _height = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _setSize();
  }

  void _setSize() {
    if (widget.width.isInfinite) {
      _width = MediaQuery.of(context).size.width;
    }
    if (widget.height.isInfinite) {
      _height = MediaQuery.of(context).size.height;
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
