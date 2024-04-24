import 'package:flutter/material.dart';

class InfoDetailScreen extends StatelessWidget {
  const InfoDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    Orientation screenOrientation = MediaQuery.of(context).orientation;

    return Scaffold(
      backgroundColor: Colors.brown,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // perbaikan #1
          crossAxisAlignment: CrossAxisAlignment.stretch, // perbaikan #1
          children: [
            Text(
              'Screen Size : ${screenSize.width.toStringAsFixed(2)}',
              style: TextStyle(color: Colors.white, fontSize: 18),
              textAlign: TextAlign.center,
            ),
            Text(
              'Screen Size : ${screenSize.width.toStringAsFixed(2)}',
              style: TextStyle(color: Colors.white, fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
