import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

CustomTransitionPage<void> slideTransitionRight(
    GoRouterState state, Widget page) {
  return CustomTransitionPage<void>(
    transitionDuration: const Duration(milliseconds: 150),
    reverseTransitionDuration: const Duration(milliseconds: 150),
    key: state.pageKey,
    child: page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      animation = CurvedAnimation(
        parent: animation,
        curve: Curves.linear,
        reverseCurve: Curves.linear,
      );
      return SlideTransition(
        position:
            Tween(begin: const Offset(1.0, 0.0), end: const Offset(0.0, 0.0))
                .animate(animation),
        child: child,
      );
    },
  );
}

CustomTransitionPage<void> bottomTransition(
    GoRouterState state, Widget page) {
  return CustomTransitionPage<void>(
    transitionDuration: const Duration(milliseconds: 150),
    reverseTransitionDuration: const Duration(milliseconds: 150),
    key: state.pageKey,
    child: page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      animation = CurvedAnimation(
        parent: animation,
        curve: Curves.linear,
        reverseCurve: Curves.linear,
      );
      return SlideTransition(
        position:
        Tween(begin: const Offset(0.0, 1.0), end: const Offset(0.0, 0.0))
            .animate(animation),
        child: child,
      );
    },
  );
}

CustomTransitionPage<void> fadeTransition(GoRouterState state, Widget page) {
  return CustomTransitionPage<void>(
    transitionDuration: const Duration(milliseconds: 20),
    reverseTransitionDuration: const Duration(milliseconds: 20),
    key: state.pageKey,
    child: page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: page,
      );
    },
  );
}
