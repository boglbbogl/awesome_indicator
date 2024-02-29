import 'package:awesome_indicator/mode/awesome_indicator_mode.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SlideWidget extends StatefulWidget {
  final AwesomeIndicatorMode mode;
  final ScrollController controller;
  final Axis scrollDirection;
  final double indicator;
  final double? width;
  final double? height;
  final double maxWidth;
  final double maxHeight;
  final double radius;
  final EdgeInsetsGeometry margin;
  final Function(int, double, Axis)? onListener;
  final Color? background;
  final Color? color;
  final Gradient? backgroundGradient;
  final Gradient? gradient;
  final bool isDebug;
  const SlideWidget({
    super.key,
    required this.mode,
    required this.controller,
    required this.scrollDirection,
    required this.indicator,
    required this.width,
    required this.height,
    required this.maxWidth,
    required this.maxHeight,
    required this.radius,
    required this.margin,
    required this.background,
    required this.color,
    required this.backgroundGradient,
    required this.gradient,
    required this.onListener,
    required this.isDebug,
  });

  @override
  State<SlideWidget> createState() => _SlideWidgetState();
}

class _SlideWidgetState extends State<SlideWidget> {
  double _width = 0;
  double _height = 0;

  final ValueNotifier<Size> _indicatorSize = ValueNotifier(const Size(0, 0));

  final ValueNotifier<double> _position = ValueNotifier(0);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _setSize();
    _setIndicator();
  }

  @override
  void didUpdateWidget(covariant SlideWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    _setSize();
    _setIndicator();
    _listener(didUpdateWidget: true);
  }

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_listener);
  }

  void _setIndicator() {
    if (widget.mode == AwesomeIndicatorMode.slideMove) {
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
    if (widget.scrollDirection == Axis.vertical) {
      _width = widget.width ?? (widget.maxWidth > 8 ? 8 : 0);
      _height = (widget.height ??
              (widget.maxHeight.isInfinite
                  ? MediaQuery.of(context).size.height
                  : widget.maxHeight)) -
          (widget.margin.collapsedSize.height < 0
              ? 0
              : widget.margin.collapsedSize.height);
    } else {
      _width = (widget.width ??
              (widget.maxWidth.isInfinite
                  ? MediaQuery.of(context).size.width
                  : widget.maxWidth)) -
          (widget.margin.collapsedSize.width < 0
              ? 0
              : widget.margin.collapsedSize.width);
      _height = widget.height ?? (widget.maxHeight > 8 ? 8 : 0);
    }
  }

  void _moveListener(bool didUpdateWidget) {
    double box = widget.scrollDirection == Axis.vertical
        ? _indicatorSize.value.height
        : _indicatorSize.value.width;
    double fullSize =
        widget.scrollDirection == Axis.vertical ? _height : _width;
    double ratio = widget.controller.position.pixels /
        widget.controller.position.maxScrollExtent;
    _position.value = (fullSize - box) * ratio;
    if (!didUpdateWidget) {
      if (widget.onListener != null) {
        widget.onListener!(
          (ratio * 100).round(),
          _position.value,
          widget.scrollDirection,
        );
      }
      _log((ratio * 100).round(), _position.value);
    }
  }

  void _fillListener(bool didUpdateWidget) {
    double fill = widget.scrollDirection == Axis.vertical ? _height : _width;
    double ratio = widget.controller.position.pixels /
        widget.controller.position.maxScrollExtent;
    double progress = fill * ratio < 0 ? 0 : fill * ratio;
    _indicatorSize.value = widget.scrollDirection == Axis.vertical
        ? Size(_width, progress)
        : Size(progress, _height);
    if (!didUpdateWidget) {
      if (widget.onListener != null) {
        widget.onListener!(
          (ratio * 100).round(),
          progress,
          widget.scrollDirection,
        );
      }
      _log((ratio * 100).round(), progress);
    }
  }

  void _listener({
    bool didUpdateWidget = false,
  }) {
    if (widget.mode == AwesomeIndicatorMode.slideMove) {
      _moveListener(didUpdateWidget);
    } else if (widget.mode == AwesomeIndicatorMode.slideFill) {
      _fillListener(didUpdateWidget);
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
            color: widget.background,
            gradient: widget.backgroundGradient,
          ),
          child: Stack(
            children: [
              ValueListenableBuilder<double>(
                valueListenable: _position,
                builder: (BuildContext context, double value, Widget? child) =>
                    Positioned(
                  top: widget.mode == AwesomeIndicatorMode.slideMove
                      ? (widget.scrollDirection == Axis.vertical ? value : 0)
                      : null,
                  left: widget.mode == AwesomeIndicatorMode.slideMove
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
                          color: widget.color,
                          gradient: widget.gradient,
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
            "AwesomeIndicator(ratio: $ratio%, pixel: ${pixel.toStringAsFixed(2)}, direction: ${widget.scrollDirection.name})");
      }
    }
  }
}
