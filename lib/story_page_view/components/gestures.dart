import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../story_stack_controller.dart';

class Gestures extends StatelessWidget {
  const Gestures({
    Key? key,
    required this.animationController,
    required this.onLongPress,
  }) : super(key: key);

  final AnimationController? animationController;
  final VoidCallback onLongPress;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            color: Colors.transparent,
            child: GestureDetector(
              onTap: () {
                animationController!.forward(from: 0);
                context.read<StoryStackController>().decrement();
              },
              onLongPress: () {
                animationController!.stop();
                onLongPress();
              },
              onLongPressUp: () {
                animationController!.forward();
              },
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.transparent,
            child: GestureDetector(
              onTap: () {
                context.read<StoryStackController>().increment(
                      restartAnimation: () =>
                          animationController!.forward(from: 0),
                      completeAnimation: () => animationController!.value = 1,
                    );
              },
              onLongPress: () {
                animationController!.stop();
              },
              onLongPressUp: () {
                animationController!.forward();
              },
            ),
          ),
        ),
      ],
    );
  }
}
