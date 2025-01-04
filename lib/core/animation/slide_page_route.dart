import 'package:flutter/material.dart';

class SlidePageRoute extends PageRouteBuilder {
  final Widget page;

  SlidePageRoute({required this.page})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            // Push: Right-to-left
            const pushBegin = Offset(1.0, 0.0);
            const pushEnd = Offset.zero;

            // Pop: Left-to-right
            const popBegin = Offset(-1.0, 0.0);
            const popEnd = Offset.zero;

            const curve = Curves.easeInOut;
            var tween = Tween(
              begin: animation.status == AnimationStatus.reverse
                  ? popBegin
                  : pushBegin,
              end: animation.status == AnimationStatus.reverse
                  ? popEnd
                  : pushEnd,
            ).chain(CurveTween(curve: curve));

            var offsetAnimation = animation.drive(tween);

            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 800),
        );
}
