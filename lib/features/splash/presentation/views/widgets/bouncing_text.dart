import 'package:flutter/material.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class BouncingText extends StatelessWidget {
  const BouncingText({
    super.key,
    this.onIncomingFinish,
    required this.text,
  });
  final dynamic Function(Key?)? onIncomingFinish;
  final String text;
  @override
  Widget build(BuildContext context) {
    return TextAnimator(
      onIncomingAnimationComplete: onIncomingFinish,
      incomingEffect: WidgetTransitionEffects.incomingScaleDown(),
      atRestEffect: WidgetRestingEffects.bounce(),
      outgoingEffect: WidgetTransitionEffects.outgoingScaleUp(),
      text,
      style: const TextStyle(
        fontFamily: 'Booklove',
        fontSize: 72,
      ),
    );
  }
}
