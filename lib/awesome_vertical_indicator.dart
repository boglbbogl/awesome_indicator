import 'package:flutter/material.dart';

class AwesomeVerticalIndicator extends StatelessWidget {
  final Widget? child;
  final ScrollController controller;
  const AwesomeVerticalIndicator({
    Key? key,
    this.child,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxHeight.isInfinite || child == null) {
          return const SizedBox();
        } else {
          return _Widget(
            height: constraints.maxHeight,
            width: constraints.maxWidth,
            controller: controller,
            child: child,
          );
        }
      },
    );
  }
}

class _Widget extends StatefulWidget {
  final double height;
  final double width;
  final Widget? child;
  final ScrollController controller;
  const _Widget({
    Key? key,
    required this.height,
    required this.width,
    required this.child,
    required this.controller,
  }) : super(key: key);

  @override
  State<_Widget> createState() => __WidgetState();
}

class __WidgetState extends State<_Widget> {
  double? maxScrollExtent;

  @override
  void initState() {
    super.initState();

    widget.controller.addListener(() {
      print(widget.controller.offset);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      maxScrollExtent = widget.controller.position.maxScrollExtent.isInfinite
          ? null
          : widget.controller.position.maxScrollExtent;
      print(widget.controller.position.maxScrollExtent);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      color: Colors.transparent,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: widget.child!),
          Container(
            height: widget.height,
            width: 4,
            color: Colors.red,
            child: Stack(
              children: [
                Positioned(
                  top: 100,
                  child: Container(
                    width: 4,
                    height: 100,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
