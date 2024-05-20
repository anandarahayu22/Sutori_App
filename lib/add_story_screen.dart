import 'dart:math';
import 'package:flutter/material.dart';

double randomBorderRadius() {
  return Random().nextDouble() * 20;
}

double randomMargin() {
  return Random().nextDouble() * 20;
}

Color randomColor() {
  return Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
}

class AddStoryScreen extends StatefulWidget {
  const AddStoryScreen({super.key});

  @override
  State<AddStoryScreen> createState() => _AddStoryScreenState();
}

class _AddStoryScreenState extends State<AddStoryScreen> {
  late double borderRadius;
  late double margin;
  late Color color;
  Offset position = Offset(0, 0);

  @override
  void initState() {
    super.initState();
    borderRadius = randomBorderRadius();
    margin = randomMargin();
    color = randomColor();
  }

  void changesState() {
    setState(() {
      borderRadius = randomBorderRadius();
      margin = randomMargin();
      color = randomColor();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: position.dx,
            top: position.dy,
            child: Draggable(
              feedback: buildAnimatedContainer(),
              childWhenDragging: Container(),
              onDragEnd: (details) {
                setState(() {
                  position = details.offset;
                });
              },
              child: buildAnimatedContainer(),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: changesState,
              child: Text('Ubah'),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildAnimatedContainer() {
    return SizedBox(
      width: 100,
      height: 100,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 2000),
        curve: Curves.bounceIn,
        margin: EdgeInsets.all(margin),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: AddStoryScreen(),
  ));
}
