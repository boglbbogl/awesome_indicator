library awesome_indicator;

import 'package:flutter/material.dart';

class AwesomeIndicator extends StatefulWidget {
  final ScrollController controller;
  final double? height;
  final double? width;
  final double indicator;
  final Color? backgroud;
  final Color? color;
  final double? radius;
  final Border? border;
  final Function(int, double)? onListener;

  const AwesomeIndicator({
    super.key,
    required this.controller,
    this.height,
    this.width,
    this.backgroud,
    this.color,
    this.radius,
    this.indicator = 0.5,
    this.border,
    this.onListener,
  });

  @override
  State<AwesomeIndicator> createState() => _AwesomeIndicatorState();
}

class _AwesomeIndicatorState extends State<AwesomeIndicator> {
  double _height = 0;
  double _width = 0;
  double _indicator = 0;

  final ValueNotifier<double> _position = ValueNotifier(0);

  @override
  void didUpdateWidget(covariant AwesomeIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    _height = widget.height ?? 8;
    _width = widget.width ?? MediaQuery.of(context).size.width;
    _setIndicator();
  }

  @override
  void initState() {
    super.initState();
    _height = widget.height ?? 8;
    widget.controller.addListener(() => _listener());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _width = widget.width ?? MediaQuery.of(context).size.width;
    _setIndicator();
  }

  void _setIndicator() {
    _indicator = widget.indicator >= 1
        ? 1
        : widget.indicator <= 0
            ? 0
            : widget.indicator;
  }

  void _listener() {
    double box = _width * _indicator;
    double ratio = widget.controller.position.pixels /
        widget.controller.position.maxScrollExtent;
    _position.value = (_width - box) * ratio;
    if (widget.onListener != null) {
      widget.onListener!((ratio * 100).round(), _position.value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            border: widget.border,
            borderRadius: BorderRadius.circular(widget.radius ?? _width),
            color: widget.backgroud ?? const Color.fromRGBO(195, 195, 195, 1),
          ),
          child: Stack(
            children: [
              ValueListenableBuilder<double>(
                  valueListenable: _position,
                  builder: (
                    BuildContext context,
                    double position,
                    Widget? child,
                  ) {
                    return Positioned(
                      left: position,
                      child: Container(
                        width: _width * _indicator,
                        height: _height,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(widget.radius ?? _width),
                          color: widget.color ?? Colors.black,
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ],
    );
  }
}
