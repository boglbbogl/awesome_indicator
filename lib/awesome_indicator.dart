library awesome_indicator;

import 'package:awesome_indicator/mode/awesome_indicator_mode.dart';
import 'package:awesome_indicator/widgets/page_widget.dart';
import 'package:awesome_indicator/widgets/slide_widget.dart';
import 'package:flutter/material.dart';

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
  })  : mode = AwesomeIndicatorMode.slideMove,
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
    radius = widget.radius ?? radius;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _setColor();
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
            width: widget.width,
            height: widget.height,
            maxWidth: constraints.maxWidth,
            maxHeight: constraints.maxHeight,
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
