import 'package:flutter/material.dart';

class MPinAnim extends StatefulWidget {
  @override
  _MPinAnimState createState() => _MPinAnimState();
}

class _MPinAnimState extends State<MPinAnim>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _sizeAnimation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    )..addListener(() {
        if (_controller.status == AnimationStatus.completed)
          _controller.reverse();
        setState(() {});
      });

    _sizeAnimation = Tween<double>(begin: 24, end: 72).animate(_controller);
    _controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _sizeAnimation.value,
      width: _sizeAnimation.value,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(_sizeAnimation.value / 2),
          color: Colors.white),
    );
  }
}
