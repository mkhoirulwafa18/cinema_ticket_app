import 'package:cinema_ticket_app/widgets/animated_scale_widget.dart';
import 'package:flutter/material.dart';

class NeumorphicButton extends StatelessWidget {
  const NeumorphicButton(
      {this.width,
      this.height,
      this.shape = BoxShape.circle,
      required this.child,
      super.key,
      this.onTap});

  final Widget child;
  final BoxShape shape;
  final double? width;
  final double? height;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return AnimatedScaleWidget(
      pressedScale: 0.9,
      duration: const Duration(milliseconds: 150),
      onTap: onTap,
      child: Container(
          height: height ?? 90,
          width: width ?? 90,
          margin: const EdgeInsets.only(left: 12),
          decoration: BoxDecoration(
            borderRadius: shape != BoxShape.circle
                ? const BorderRadius.all(Radius.circular(20))
                : const BorderRadius.all(Radius.circular(999)),
            gradient: const LinearGradient(
              begin: Alignment(-1, -1),
              end: Alignment(1, 1),
              colors: [
                Color(0xff232527),
                Color(0xff151617),
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: const Offset(6, 6),
                blurRadius: 6,
              ),
            ],
          ),
          child: child),
    );
  }
}
