import 'package:flutter/material.dart';

/// Tipos de animaciones
enum AnimationType { normal, fadeIn }

/// Main Class, [context] es el Buildcontext de la aplicación en ese momento
/// [child] es el widget a navegar
/// [animation] es el tipo de animación
/// [duration] duración de la transición
/// [replacement] determina si la transción es destructiva o no
class RouteTransitions {
  final BuildContext context;
  final Widget child;
  final AnimationType animation;
  final Duration duration;
  final bool replacement;

  RouteTransitions({
    required this.context,
    required this.child,
    this.animation = AnimationType.normal,
    this.duration = const Duration(milliseconds: 300),
    this.replacement = false,
  }) {
    switch (animation) {
      case AnimationType.normal:
        _nomalTransition();
        break;
      case AnimationType.fadeIn:
        _fadeInTransition();
        break;
      default:
    }
  }

  /// Push normal del screen
  void _pushRoute(Route route) => Navigator.push(context, route);

  /// PushReplacement del screen
  void _pushReplacementRoute(Route route) =>
      Navigator.pushReplacement(context, route);

  /// Handler de transición normal
  void _nomalTransition() {
    final route = MaterialPageRoute(builder: (_) => child);
    (replacement) ? _pushReplacementRoute(route) : _pushRoute(route);
  }

  /// Handler de la transición con la animación FadeIn
  void _fadeInTransition() {
    final route = PageRouteBuilder(
      pageBuilder: (_, __, ___) => child,
      transitionDuration: duration,
      transitionsBuilder: (_, animation, __, child) {
        return FadeTransition(
          child: child,
          opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeOut)),
        );
      },
    );

    (replacement) ? _pushReplacementRoute(route) : _pushRoute(route);
  }
}
