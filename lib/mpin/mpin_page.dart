import 'package:bank_mpin/mpin/mpin_anim.dart';
import 'package:flutter/material.dart';

class MPinPage extends StatefulWidget {
  @override
  _MPinPageState createState() => _MPinPageState();
}

class _MPinPageState extends State<MPinPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //Background
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.lightBlue, Colors.purple, Colors.pink]),
            ),
          ),
          //Animated pin
          Center(
            child: MPinAnim(),
          ),
        ],
      ),
    );
  }
}
