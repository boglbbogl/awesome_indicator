import 'package:awesome_indicator/awesome_slide_indicator_mode.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AwesomeSlideIndicator extends StatelessWidget {
  const AwesomeSlideIndicator({
    super.key,
    required this.controller,
  })  : mode = AwesomeSlideIndicatorMode.none,
        scrollDirection = Axis.horizontal,
        width = null,
        height = null,
        indicator = null,
        backgroundColor = null,
        color = null,
        backgroundGradient = null,
        indicatorGradient = null,
        radius = null,
        onListener = null,
        margin = null,
        isDebug = false;

  const AwesomeSlideIndicator.fill({
    super.key,
    this.scrollDirection = Axis.horizontal,
    required this.controller,
    this.width,
    this.height,
    this.backgroundColor,
    this.color,
    this.backgroundGradient,
    this.indicatorGradient,
    this.radius,
    this.onListener,
    this.margin,
    this.isDebug = true,
  })  : indicator = 0,
        mode = AwesomeSlideIndicatorMode.fill;

  const AwesomeSlideIndicator.vertical({
    super.key,
    required this.controller,
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
  })  : scrollDirection = Axis.vertical,
        mode = AwesomeSlideIndicatorMode.move;

  const AwesomeSlideIndicator.horizontal({
    super.key,
    required this.controller,
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
  })  : scrollDirection = Axis.horizontal,
        mode = AwesomeSlideIndicatorMode.move;

  final AwesomeSlideIndicatorMode mode;
  final Axis scrollDirection;
  final ScrollController controller;
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
    return switch (mode) {
      AwesomeSlideIndicatorMode.none => const SizedBox(),
      _ => LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) =>
              _Widget(
            mode: mode,
            scrollDirection: scrollDirection,
            controller: controller,
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
        ),
    };
  }
}

class _Widget extends StatefulWidget {
  final AwesomeSlideIndicatorMode mode;
  final Axis scrollDirection;
  final ScrollController controller;
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
    required this.mode,
    required this.scrollDirection,
    required this.controller,
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

  final ValueNotifier<Size> _indicatorSize = ValueNotifier(const Size(0, 0));

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
    if (widget.mode == AwesomeSlideIndicatorMode.move) {
      double indicator = widget.indicator >= 1
          ? 1
          : widget.indicator <= 0
              ? 0
              : widget.indicator;
      if (widget.scrollDirection == Axis.vertical) {
        _indicatorSize.value = Size(_width, _height * indicator);
      } else {
        _indicatorSize.value = Size(_width * indicator, _height);
      }
    }
  }

  void _setSize() {
    if (widget.mode == AwesomeSlideIndicatorMode.move) {
      _width = (widget.width.isInfinite
          ? MediaQuery.of(context).size.width
          : widget.width);
      _height = widget.height.isInfinite
          ? MediaQuery.of(context).size.height
          : widget.height;
    } else if (widget.mode == AwesomeSlideIndicatorMode.fill) {
      _width = widget.width.isInfinite ? 8 : widget.width;
      _height = widget.height.isInfinite ? 8 : widget.height;
    }
    if (widget.scrollDirection == Axis.vertical) {
      _height = _height - widget.margin.collapsedSize.height < 0
          ? 0
          : _height - widget.margin.collapsedSize.height;
    } else {
      _width = _width - widget.margin.collapsedSize.width < 0
          ? 0
          : _width - widget.margin.collapsedSize.width;
    }
  }

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_listener);
  }

  void _moveListener() {
    double box = widget.scrollDirection == Axis.vertical
        ? _indicatorSize.value.height
        : _indicatorSize.value.width;
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

  void _fillListener() {
    double fill = widget.scrollDirection == Axis.vertical ? _height : _width;
    double ratio = widget.controller.position.pixels /
        widget.controller.position.maxScrollExtent;
    double progress = fill * ratio < 0 ? 0 : fill * ratio;
    _indicatorSize.value = widget.scrollDirection == Axis.vertical
        ? Size(_width, progress)
        : Size(progress, _height);
    if (widget.onListener != null) {
      widget.onListener!(
        (ratio * 100).round(),
        progress,
        widget.scrollDirection,
      );
    }
    _log((ratio * 100).round(), progress);
  }

  void _listener() {
    if (widget.mode == AwesomeSlideIndicatorMode.move) {
      _moveListener();
    } else if (widget.mode == AwesomeSlideIndicatorMode.fill) {
      _fillListener();
    }
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
                  top: widget.mode == AwesomeSlideIndicatorMode.move
                      ? (widget.scrollDirection == Axis.vertical ? value : 0)
                      : null,
                  left: widget.mode == AwesomeSlideIndicatorMode.move
                      ? (widget.scrollDirection == Axis.horizontal ? value : 0)
                      : null,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(widget.radius),
                    child: ValueListenableBuilder<Size>(
                      valueListenable: _indicatorSize,
                      builder:
                          (BuildContext context, Size size, Widget? child) =>
                              Container(
                        width: size.width,
                        height: size.height,
                        decoration: BoxDecoration(
                          color: _indicatorColor,
                          gradient: widget.indicatorGradient,
                        ),
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
        print(
            "AwesomeSlideIndicator(ratio: $ratio%, pixel: ${pixel.toStringAsFixed(2)}, direction: ${widget.scrollDirection.name})");
      }
    }
  }
}
