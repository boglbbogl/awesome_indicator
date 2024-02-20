library awesome_indicator;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

export 'awesome_slide_indicator.dart';

enum AwesomeIndicatorMode { none, slideMove, slideFill, page }

class AwesomeIndicator extends StatefulWidget {
  const AwesomeIndicator({super.key})
      : scrollDirection = null,
        indicator = null,
        width = null,
        height = null,
        mode = AwesomeIndicatorMode.none,
        scrollController = null,
        pageController = null,
        pageChildren = const <Widget>[],
        pageItemBuilder = null,
        margin = null,
        onListener = null,
        isDebug = false,
        background = null,
        color = null,
        backgroundGradient = null,
        gradient = null,
        radius = null;

  const AwesomeIndicator.move({
    super.key,
    this.scrollDirection = Axis.horizontal,
    required ScrollController controller,
    this.indicator,
    this.width,
    this.height,
    this.radius,
    this.margin,
    this.onListener,
    this.background,
    this.color,
    this.backgroundGradient,
    this.gradient,
    this.isDebug = true,
  })  : mode = AwesomeIndicatorMode.slideFill,
        scrollController = controller,
        pageController = null,
        pageChildren = const <Widget>[],
        pageItemBuilder = null;

  const AwesomeIndicator.fill({
    super.key,
    this.scrollDirection = Axis.horizontal,
    required ScrollController controller,
    this.indicator,
    this.width,
    this.height,
    this.radius,
    this.margin,
    this.onListener,
    this.background,
    this.color,
    this.backgroundGradient,
    this.gradient,
    this.isDebug = true,
  })  : mode = AwesomeIndicatorMode.slideFill,
        scrollController = controller,
        pageController = null,
        pageChildren = const <Widget>[],
        pageItemBuilder = null;

  const AwesomeIndicator.pageBuilder({
    super.key,
    required Widget? Function(BuildContext, int) itemBuilder,
    PageController? controller,
    this.indicator,
    this.radius,
    this.onListener,
    this.background,
    this.color,
    this.backgroundGradient,
    this.gradient,
    this.isDebug = true,
  })  : mode = AwesomeIndicatorMode.page,
        scrollDirection = null,
        width = null,
        height = null,
        scrollController = null,
        pageController = controller,
        pageChildren = const <Widget>[],
        pageItemBuilder = itemBuilder,
        margin = null;

  const AwesomeIndicator.pageView({
    super.key,
    PageController? controller,
    List<Widget> children = const <Widget>[],
    this.indicator,
    this.radius,
    this.onListener,
    this.background,
    this.color,
    this.backgroundGradient,
    this.gradient,
    this.isDebug = true,
  })  : mode = AwesomeIndicatorMode.page,
        scrollDirection = null,
        width = null,
        height = null,
        scrollController = null,
        pageController = controller,
        pageChildren = children,
        pageItemBuilder = null,
        margin = null;

  final AwesomeIndicatorMode mode;
  final Axis? scrollDirection;
  final ScrollController? scrollController;
  final PageController? pageController;
  final double? indicator;
  final double? width;
  final double? height;
  final double? radius;
  final List<Widget> pageChildren;
  final Widget? Function(BuildContext, int)? pageItemBuilder;
  final EdgeInsetsGeometry? margin;
  final Function(int, double, Axis)? onListener;
  final Color? background;
  final Color? color;
  final Gradient? backgroundGradient;
  final Gradient? gradient;
  final bool isDebug;

  @override
  State<AwesomeIndicator> createState() => _AwesomeIndicatorState();
}

class _AwesomeIndicatorState extends State<AwesomeIndicator> {
  double radius = 8;
  Color? background;
  Color? color;

  @override
  void initState() {
    super.initState();
    _setColor();
    radius = widget.radius ?? radius;
  }

  void _setColor() {
    if (Theme.of(context).brightness == Brightness.dark) {
      background = widget.background ?? const Color.fromRGBO(125, 125, 125, 1);
      color = widget.color ?? const Color.fromRGBO(245, 245, 245, 1);
    } else {
      background = widget.background ?? const Color.fromRGBO(165, 165, 165, 1);
      color = widget.color ?? const Color.fromRGBO(45, 45, 45, 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return switch (widget.mode) {
      AwesomeIndicatorMode.none => const SizedBox(),
      AwesomeIndicatorMode.slideMove ||
      AwesomeIndicatorMode.slideFill =>
        LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) =>
              SlideWidget(
            mode: widget.mode,
            controller: widget.scrollController!,
            scrollDirection: widget.scrollDirection!,
            indicator: widget.indicator ?? 0.35,
            width: widget.width ?? constraints.maxWidth,
            height: widget.height ?? constraints.maxHeight,
            radius: radius,
            margin: widget.margin ?? EdgeInsets.zero,
            onListener: widget.onListener,
            background: background,
            color: color,
            backgroundGradient: widget.backgroundGradient,
            gradient: widget.gradient,
            isDebug: widget.isDebug,
          ),
        ),
      AwesomeIndicatorMode.page => const PageWidget(),
    };
  }
}

class SlideWidget extends StatefulWidget {
  final AwesomeIndicatorMode mode;
  final ScrollController controller;
  final Axis scrollDirection;
  final double indicator;
  final double width;
  final double height;
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

  Color? _backgroundColor;
  Color? _indicatorColor;

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
    if (widget.mode == AwesomeIndicatorMode.slideMove) {
      _width = (widget.width.isInfinite
          ? MediaQuery.of(context).size.width
          : widget.width);
      _height = widget.height.isInfinite
          ? MediaQuery.of(context).size.height
          : widget.height;
    } else if (widget.mode == AwesomeIndicatorMode.slideFill) {
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
    if (widget.mode == AwesomeIndicatorMode.slideMove) {
      _moveListener();
    } else if (widget.mode == AwesomeIndicatorMode.slideFill) {
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
                          color: _indicatorColor,
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
            "AwesomeSlideIndicator(ratio: $ratio%, pixel: ${pixel.toStringAsFixed(2)}, direction: ${widget.scrollDirection.name})");
      }
    }
  }
}

class PageWidget extends StatefulWidget {
  const PageWidget({super.key});

  @override
  State<PageWidget> createState() => _PageWidgetState();
}

class _PageWidgetState extends State<PageWidget> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
