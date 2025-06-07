
import 'package:flutter/material.dart';

class BounceReflexButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String label;
  final Color color;
  final double fontSize;
  final double borderRadius;
  final EdgeInsets padding;

  const BounceReflexButton({
    Key? key,
    required this.onPressed,
    required this.label,
    this.color = Colors.blue,
    this.fontSize = 16,
    this.borderRadius = 12,
    this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
  }) : super(key: key);

  @override
  State<BounceReflexButton> createState() => _BounceReflexButtonState();
}

class _BounceReflexButtonState extends State<BounceReflexButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _controller.reverse();
    widget.onPressed();
  }

  void _onTapCancel() {
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: Transform.scale(
        scale: 1 - _controller.value,
        child: Container(
          padding: widget.padding,
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          child: Text(
            widget.label,
            style: TextStyle(
              color: Colors.white,
              fontSize: widget.fontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class RippleReflexButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final Color color;
  final double fontSize;
  final double borderRadius;
  final EdgeInsets padding;

  const RippleReflexButton({
    Key? key,
    required this.onPressed,
    required this.label,
    this.color = Colors.green,
    this.fontSize = 16,
    this.borderRadius = 12,
    this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(borderRadius),
        splashColor: color,
        child: Ink(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          padding: padding,
          child: Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
class LoadingReflexButton extends StatefulWidget {
  final Future<void> Function() onPressed;
  final String label;
  final Color color;
  final double fontSize;
  final double borderRadius;
  final EdgeInsets padding;
  final Duration loadingDuration;

  const LoadingReflexButton({
    Key? key,
    required this.onPressed,
    required this.label,
    this.color = Colors.orange,
    this.fontSize = 16,
    this.borderRadius = 12,
    this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    this.loadingDuration = const Duration(seconds: 2),
  }) : super(key: key);

  @override
  State<LoadingReflexButton> createState() => _LoadingReflexButtonState();
}

class _LoadingReflexButtonState extends State<LoadingReflexButton> {
  bool _isLoading = false;

  void _handlePress() async {
    setState(() {
      _isLoading = true;
    });

    await widget.onPressed();

    await Future.delayed(widget.loadingDuration);

    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: widget.color,
        padding: widget.padding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ),
      ),
      onPressed: _isLoading ? null : _handlePress,
      child: _isLoading
          ? const SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(
          color: Colors.white,
          strokeWidth: 2,
        ),
      )
          : Text(
        widget.label,
        style: TextStyle(
          fontSize: widget.fontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
class IconReflexButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final IconData icon;
  final Color color;
  final double fontSize;
  final double iconSize;
  final double borderRadius;
  final EdgeInsets padding;

  const IconReflexButton({
    Key? key,
    required this.onPressed,
    required this.label,
    required this.icon,
    this.color = Colors.purple,
    this.fontSize = 16,
    this.iconSize = 20,
    this.borderRadius = 12,
    this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: padding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      icon: Icon(icon, size: iconSize, color: Colors.white),
      label: Text(
        label,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
class ShadowedReflexButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final Color color;
  final double fontSize;
  final double borderRadius;
  final EdgeInsets padding;
  final List<BoxShadow> boxShadow;

  const ShadowedReflexButton({
    Key? key,
    required this.onPressed,
    required this.label,
    this.color = Colors.teal,
    this.fontSize = 16,
    this.borderRadius = 12,
    this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    this.boxShadow = const [
      BoxShadow(
        color: Colors.black26,
        blurRadius: 6,
        offset: Offset(0, 3),
      ),
    ],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: boxShadow,
        ),
        child: Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

