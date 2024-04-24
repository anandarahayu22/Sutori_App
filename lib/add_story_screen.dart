import 'package:flutter/material.dart';

class AddStoryScreen extends StatelessWidget {
  const AddStoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(154, 161, 91, 41),
      body: LayoutBuilder(
        builder: (BuildContext context, constraints) {
          if (constraints.maxWidth < 600) {
            return ListView(
              children: _generateConstraints(),
            );
          } else if (constraints.maxWidth < 900) {
            return GridView.count(
              crossAxisCount: 2,
              children: _generateConstraints(),
            );
          } else {
            return GridView.count(
              crossAxisCount: 6,
              children: _generateConstraints(),
            );
          }
        },
      ),
    );
  }

  List<Widget> _generateConstraints() {
    return List<Widget>.generate(10, (index) {
      return Container(
        margin: EdgeInsets.all(8),
        color: Colors.brown,
        height: 200,
      );
    });
  }
}
