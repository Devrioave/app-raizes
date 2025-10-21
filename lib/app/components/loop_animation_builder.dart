import 'package:flutter/material.dart';

class LoopAnimationBuilder extends StatefulWidget {
  const LoopAnimationBuilder({
    Key? key,
    this.duration = const Duration(milliseconds: 500),
    this.child,
    required this.builder,
  }) : super(key: key);

  final Duration duration;
  final Widget? child;
  final Widget Function(BuildContext context, double value, Widget? child) builder;

  @override
  _LoopAnimationBuilderState createState() => _LoopAnimationBuilderState();
}

class _LoopAnimationBuilderState extends State<LoopAnimationBuilder>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    )
      ..forward()
      ..addListener(() {
        if (controller.isCompleted) {
          controller.repeat();
        }
      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return widget.builder(context, controller.value, child);
      },
      child: widget.child,
    );
  }
}
