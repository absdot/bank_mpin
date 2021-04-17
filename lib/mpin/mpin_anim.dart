import 'package:flutter/material.dart';

class MPinAnimController {
  void Function(String) animate;
}

class MPinAnim extends StatefulWidget {
  final MPinAnimController animController;

  const MPinAnim({Key key, this.animController}) : super(key: key);
  @override
  _MPinAnimState createState() => _MPinAnimState(animController);
}

class _MPinAnimState extends State<MPinAnim>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _sizeAnimation;
  Animation<double> _opacityAnimation;

  void animate(String input) {
    _controller.forward();
  }

  _MPinAnimState(MPinAnimController animController) {
    animController.animate = animate;
  }
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
    _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _sizeAnimation.value,
      width: _sizeAnimation.value,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(_sizeAnimation.value / 2),
          color: Colors.white),
      child: Opacity(
        opacity: _opacityAnimation.value,
        child: Transform.scale(
          scale: _sizeAnimation.value / 48,
          child: Text(
            '1',
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
