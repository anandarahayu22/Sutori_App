import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class InfoDetailScreen extends StatefulWidget {
  const InfoDetailScreen({super.key});

  @override
  State<InfoDetailScreen> createState() => _InfoDetailScreenState();
}

class _InfoDetailScreenState extends State<InfoDetailScreen> {
  final double boxSize = 150.0;
  int numOfSingleTap = 0;
  int numOfDoubleTap = 0;
  int numOfLongPress = 0;

  double posX = 0.0;
  double posY = 0.0;

  @override
  Widget build(BuildContext context) {
    if (posX == 0) {
      CenterPosition(context);
    }

    return Scaffold(
      body: Stack(children: [
        Positioned(
          left: posX,
          top: posY,
          child: GestureDetector(
            onPanUpdate: (DragUpdateDetails details) {
              setState(() {
                double verticalPosition = details.delta.dy;
                double horizontalPosition = details.delta.dx;
                posX += horizontalPosition;
                posY += verticalPosition;
              });
            },
            onTap: () {
              setState(() {
                numOfSingleTap++;
              });
            },
            onDoubleTap: () {
              setState(() {
                numOfDoubleTap++;
              });
            },
            onLongPress: () {
              setState(() {
                numOfLongPress++;
              });
            },
            child: Container(
              width: boxSize,
              height: boxSize,
              color: Colors.brown,
            ),
          ),
        ),
      ]),
      bottomNavigationBar: Text(
        'Taps: $numOfSingleTap - Double Taps: $numOfDoubleTap - Long Press: $numOfLongPress',
        style: TextStyle(fontSize: 20),
      ),
    );
  }

  void CenterPosition(BuildContext context) {
    posX = (MediaQuery.of(context).size.width / 2) - boxSize / 2;
    posY = (MediaQuery.of(context).size.height / 2) - boxSize / 2 - 30;

    setState(() {
      this.posX = posX;
      this.posY = posY;
    });
  }
}
