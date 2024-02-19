library awesome_indicator;

import 'package:flutter/material.dart';

export 'awesome_slide_indicator.dart';

enum AwesomeIndicatorMode { empty, slideMove, slideFill, page }

class AwesomeIndicator extends StatefulWidget {
  const AwesomeIndicator({super.key})
      : scrollDirection = null,
        width = null,
        height = null,
        mode = AwesomeIndicatorMode.empty,
        scrollController = null,
        pageController = null,
        pageChildren = const <Widget>[],
        pageItemBuilder = null;

  const AwesomeIndicator.move({
    super.key,
    this.scrollDirection = Axis.horizontal,
    required ScrollController controller,
    this.width,
    this.height,
  })  : mode = AwesomeIndicatorMode.slideFill,
        scrollController = controller,
        pageController = null,
        pageChildren = const <Widget>[],
        pageItemBuilder = null;

  const AwesomeIndicator.fill({
    super.key,
    this.scrollDirection = Axis.horizontal,
    required ScrollController controller,
    this.width,
    this.height,
  })  : mode = AwesomeIndicatorMode.slideFill,
        scrollController = controller,
        pageController = null,
        pageChildren = const <Widget>[],
        pageItemBuilder = null;

  const AwesomeIndicator.pageBuilder({
    super.key,
    required Widget? Function(BuildContext, int) itemBuilder,
    PageController? controller,
  })  : mode = AwesomeIndicatorMode.page,
        scrollDirection = null,
        width = null,
        height = null,
        scrollController = null,
        pageController = controller,
        pageChildren = const <Widget>[],
        pageItemBuilder = itemBuilder;

  const AwesomeIndicator.pageView({
    super.key,
    PageController? controller,
    List<Widget> children = const <Widget>[],
  })  : mode = AwesomeIndicatorMode.page,
        scrollDirection = null,
        width = null,
        height = null,
        scrollController = null,
        pageController = controller,
        pageChildren = children,
        pageItemBuilder = null;

  final AwesomeIndicatorMode mode;
  final Axis? scrollDirection;
  final ScrollController? scrollController;
  final PageController? pageController;
  final double? width;
  final double? height;
  final List<Widget> pageChildren;
  final Widget? Function(BuildContext, int)? pageItemBuilder;

  @override
  State<AwesomeIndicator> createState() => _AwesomeIndicatorState();
}

class _AwesomeIndicatorState extends State<AwesomeIndicator> {
  @override
  Widget build(BuildContext context) {
    return switch (widget.mode) {
      AwesomeIndicatorMode.empty => const SizedBox(),
      AwesomeIndicatorMode.slideMove ||
      AwesomeIndicatorMode.slideFill =>
        LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) =>
              SlideWidget(
            mode: widget.mode,
            controller: widget.scrollController!,
            scrollDirection: widget.scrollDirection!,
            width: widget.width ?? constraints.maxWidth,
            height: widget.height ?? constraints.maxHeight,
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
  final double width;
  final double height;
  const SlideWidget({
    super.key,
    required this.mode,
    required this.controller,
    required this.scrollDirection,
    required this.width,
    required this.height,
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

  // void _setSize() {
  //   if (widget.mode == AwesomeIndicatorMode.slideMove) {
  //     _width = (widget.width.isInfinite
  //         ? MediaQuery.of(context).size.width
  //         : widget.width);
  //     _height = widget.height.isInfinite
  //         ? MediaQuery.of(context).size.height
  //         : widget.height;
  //   } else if (widget.mode == AwesomeIndicatorMode.slideFill) {
  //     _width = widget.width.isInfinite ? 8 : widget.width;
  //     _height = widget.height.isInfinite ? 8 : widget.height;
  //   }
  //   if (widget.scrollDirection == Axis.vertical) {
  //     _height = _height - widget.margin.collapsedSize.height < 0
  //         ? 0
  //         : _height - widget.margin.collapsedSize.height;
  //   } else {
  //     _width = _width - widget.margin.collapsedSize.width < 0
  //         ? 0
  //         : _width - widget.margin.collapsedSize.width;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [],
    );
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
