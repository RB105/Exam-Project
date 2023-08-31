import 'package:flutter/material.dart';

class FadePageRoute<T> extends PageRouteBuilder<T> {
  final Widget Function(T) builder;
  final T parameter;

  FadePageRoute({required this.parameter, required this.builder})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => builder(
            parameter,
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
}
