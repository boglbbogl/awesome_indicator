import 'package:awesome_indicator/awesome_indicator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AwesomeScrollIndicator extends StatelessWidget {
  const AwesomeScrollIndicator({
    super.key,
    required this.scrollDirection,
    required this.controller,
    this.mode = AwesomeIndicatorMode.move,
    this.width,
    this.height,
    this.indicator,
    this.backgroundColor,
    this.color,
    this.backgroundGradient,
    this.indicatorGradient,
    this.radius,
    this.onListener,
    this.margin,
    this.isDebug = true,
  });

  const AwesomeScrollIndicator.vertical({
    super.key,
    required this.controller,
    this.mode = AwesomeIndicatorMode.move,
    this.width = 8,
    this.height,
    this.indicator,
    this.backgroundColor,
    this.color,
    this.backgroundGradient,
    this.indicatorGradient,
    this.radius,
    this.onListener,
    this.margin,
    this.isDebug = true,
  }) : scrollDirection = Axis.vertical;

  const AwesomeScrollIndicator.horizontal({
    super.key,
    required this.controller,
    this.mode = AwesomeIndicatorMode.move,
    this.width,
    this.height = 8,
    this.indicator,
    this.backgroundColor,
    this.color,
    this.backgroundGradient,
    this.indicatorGradient,
    this.radius,
    this.onListener,
    this.margin,
    this.isDebug = true,
  }) : scrollDirection = Axis.horizontal;

  final Axis scrollDirection;
  final ScrollController controller;
  final AwesomeIndicatorMode mode;
  final double? width;
  final double? height;
  final double? indicator;
  final Color? backgroundColor;
  final Color? color;
  final Gradient? backgroundGradient;
  final Gradient? indicatorGradient;
  final double? radius;
  final Function(int, double, Axis)? onListener;
  final EdgeInsetsGeometry? margin;
  final bool isDebug;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) => _Widget(
        scrollDirection: scrollDirection,
        controller: controller,
        mode: mode,
        width: width ?? constraints.maxWidth,
        height: height ?? constraints.maxHeight,
        indicator: indicator ?? 0.35,
        backgroundColor: backgroundColor,
        color: color,
        backgroundGradient: backgroundGradient,
        indicatorGradient: indicatorGradient,
        radius: radius ?? 8,
        onListener: onListener,
        isDebug: isDebug,
        margin: margin ?? EdgeInsets.zero,
      ),
    );
  }
}

class _Widget extends StatefulWidget {
  final Axis scrollDirection;
  final ScrollController controller;
  final AwesomeIndicatorMode mode;
  final double width;
  final double height;
  final double indicator;
  final Color? backgroundColor;
  final Color? color;
  final Gradient? backgroundGradient;
  final Gradient? indicatorGradient;
  final double radius;
  final Function(int, double, Axis)? onListener;
  final bool isDebug;
  final EdgeInsetsGeometry margin;
  const _Widget({
    required this.scrollDirection,
    required this.controller,
    required this.mode,
    required this.width,
    required this.height,
    required this.indicator,
    required this.backgroundColor,
    required this.color,
    required this.backgroundGradient,
    required this.indicatorGradient,
    required this.radius,
    required this.onListener,
    required this.isDebug,
    required this.margin,
  });

  @override
  State<_Widget> createState() => __WidgetState();
}

class __WidgetState extends State<_Widget> {
  double _width = 0;
  double _height = 0;

  double _indicatorWidth = 0;
  double _indicatorHeight = 0;

  Color? _backgroundColor;
  Color? _indicatorColor;

  final ValueNotifier<double> _position = ValueNotifier(0);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _setSize();
    _setIndicator();
    _setColor();
  }

  @override
  void didUpdateWidget(covariant _Widget oldWidget) {
    super.didUpdateWidget(oldWidget);
    _setSize();
    _setIndicator();
    _setColor();
  }

  void _setColor() {
    if (Theme.of(context).brightness == Brightness.dark) {
      _backgroundColor =
          widget.backgroundColor ?? const Color.fromRGBO(125, 125, 125, 1);
      _indicatorColor = widget.color ?? const Color.fromRGBO(245, 245, 245, 1);
    } else {
      _backgroundColor =
          widget.backgroundColor ?? const Color.fromRGBO(165, 165, 165, 1);
      _indicatorColor = widget.color ?? const Color.fromRGBO(45, 45, 45, 1);
    }
  }

  void _setIndicator() {
    double indicator = widget.indicator >= 1
        ? 1
        : widget.indicator <= 0
            ? 0
            : widget.indicator;
    if (widget.scrollDirection == Axis.vertical) {
      _indicatorWidth = _width;
      _indicatorHeight = _height * indicator;
    } else {
      _indicatorWidth = _width * indicator;
      _indicatorHeight = _height;
    }
  }

  void _setSize() {
    _width = (widget.width.isInfinite
        ? MediaQuery.of(context).size.width
        : widget.width);
    _height = widget.height.isInfinite
        ? MediaQuery.of(context).size.height
        : widget.height;
    if (widget.scrollDirection == Axis.vertical) {
      _height = _height - widget.margin.collapsedSize.height;
    } else {
      _width = _width - widget.margin.collapsedSize.width;
    }
  }

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_listener);
  }

  void _listener() {
    double box = widget.scrollDirection == Axis.vertical
        ? _indicatorHeight
        : _indicatorWidth;
    double fullSize =
        widget.scrollDirection == Axis.vertical ? _height : _width;
    double ratio = widget.controller.position.pixels /
        widget.controller.position.maxScrollExtent;

    _position.value = (fullSize - box) * ratio;
    if (widget.onListener != null) {
      widget.onListener!(
        (ratio * 100).round(),
        _position.value,
        widget.scrollDirection,
      );
    }
    _log((ratio * 100).round(), _position.value);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      alignment: Alignment.center,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(widget.radius),
        child: Container(
          width: _width,
          height: _height,
          decoration: BoxDecoration(
              color: _backgroundColor, gradient: widget.backgroundGradient),
          child: Stack(
            children: [
              ValueListenableBuilder<double>(
                valueListenable: _position,
                builder: (BuildContext context, double value, Widget? child) =>
                    Positioned(
                  top: widget.scrollDirection == Axis.vertical ? value : 0,
                  left: widget.scrollDirection == Axis.horizontal ? value : 0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(widget.radius),
                    child: Container(
                      width: _indicatorWidth,
                      height: _indicatorHeight,
                      decoration: BoxDecoration(
                        color: _indicatorColor,
                        gradient: widget.indicatorGradient,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _log(int ratio, double pixel) {
    if (widget.isDebug) {
      if (kDebugMode) {
        if (widget.scrollDirection == Axis.vertical) {
          print(
              "AwesomeScrollIndicator.vertical(ratio: $ratio%, pixel: ${pixel.toStringAsFixed(2)}, direction: ${widget.scrollDirection.name})");
        } else {
          print(
              "AwesomeScrollIndicator.horizontal(ratio: $ratio%, pixel: ${pixel.toStringAsFixed(2)}, direction: ${widget.scrollDirection.name})");
        }
      }
    }
  }
}