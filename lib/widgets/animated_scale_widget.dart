import 'package:flutter/material.dart';

class AnimatedScaleWidget extends StatefulWidget {
  final Widget child; // The child widget to animate
  final double pressedScale; // Scale factor when pressed
  final Duration duration; // Duration of the animation
  final VoidCallback? onTap; // Tap event callback

  const AnimatedScaleWidget({
    super.key,
    required this.child,
    this.pressedScale = 0.8, // Default scale factor
    this.duration = const Duration(milliseconds: 200),
    this.onTap,
  });

  @override
  State<AnimatedScaleWidget> createState() => _AnimatedScaleWidgetState();
}

class _AnimatedScaleWidgetState extends State<AnimatedScaleWidget> {
  bool isPressed = false; // Tracks whether the widget is pressed

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          isPressed = true; // Scale down when pressed
        });
      },
      onTapUp: (_) {
        setState(() {
          isPressed = false; // Reset scale when released
        });
      },
      onTapCancel: () {
        setState(() {
          isPressed = false; // Reset scale if press is canceled
        });
      },
      onTap: widget.onTap, // Trigger the onTap callback
      child: AnimatedScale(
        scale: isPressed ? widget.pressedScale : 1.0,
        duration: widget.duration,
        child: widget.child,
      ),
    );
  }
}
