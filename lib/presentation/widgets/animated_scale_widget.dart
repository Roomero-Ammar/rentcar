import 'package:flutter/material.dart';

class AnimatedScaleWidget extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final double beginScale;
  final double endScale;
  final BorderRadius borderRadius;

  const AnimatedScaleWidget({
    Key? key,
    required this.child,
    this.duration = const Duration(seconds: 3),
    this.beginScale = 1.0,
    this.endScale = 1.5,
    this.borderRadius = BorderRadius.zero,
  }) : super(key: key);

  @override
  _AnimatedScaleWidgetState createState() => _AnimatedScaleWidgetState();
}

class _AnimatedScaleWidgetState extends State<AnimatedScaleWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    _animation = Tween<double>(begin: widget.beginScale, end: widget.endScale).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: widget.borderRadius,
      child: Transform.scale(
        scale: _animation.value,
        alignment: Alignment.center,
        child: widget.child,
      ),
    );
  }
}