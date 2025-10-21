import 'package:flutter/material.dart';

class AppearAnimation extends StatelessWidget {
  AppearAnimation({
    Key? key,
    required this.child,
    this.duration = kThemeAnimationDuration,
    this.offset = 20,
    this.delay = const Duration(milliseconds: 0),
    this.axis = Axis.vertical,
  })  : assert(duration.inMilliseconds != 0),
        super(key: key);
  final Duration duration;
  final Duration delay;
  final Widget child;
  final double offset;
  final Axis axis;

  @override
  Widget build(BuildContext context) {
    final initialPercent = delay.inMilliseconds / (duration.inMilliseconds + delay.inMilliseconds);
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: duration + delay,
      builder: (context, value, _) {
        final actualValue = 1 - 
            Curves.easeOutCubic.transform(
                value < initialPercent ? 0 : (value - initialPercent) / (1 - initialPercent));
        final Offset actualOffset;
        switch (axis) {
          case Axis.horizontal:
            actualOffset = Offset(offset * actualValue, 0);
            break;
          case Axis.vertical:
            actualOffset = Offset(0, offset * actualValue);
            break;
        }
        return Transform.translate(
          offset: actualOffset,
          child: Opacity(
            opacity: 1 - actualValue,
            child: child,
          ),
        );
      },
    );
  }
}
