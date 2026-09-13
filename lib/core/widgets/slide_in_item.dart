import 'package:flutter/material.dart';

/// Wraps [child] with a one-shot slide-up entrance animation triggered
/// the first time it builds. Uses SlideTransition (a Transform under the
/// hood) only — no Opacity/AnimatedOpacity — so it stays cheap during
/// scroll: no extra compositing layer, no rebuilds after it finishes.
class SlideInItem extends StatefulWidget {
  const SlideInItem({
    required this.child,
    this.delay = Duration.zero,
    super.key,
  });

  final Widget child;
  final Duration delay;

  @override
  State<SlideInItem> createState() => _SlideInItemState();
}

class _SlideInItemState extends State<SlideInItem>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _offset;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );
    _offset = Tween<Offset>(
      begin: const Offset(0, 0.08),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));
    Future.delayed(widget.delay, () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(position: _offset, child: widget.child);
  }
}