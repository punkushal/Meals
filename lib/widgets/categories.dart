import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick Your Category'),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, //This says how many column we need
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20, //Spacing Between column
            mainAxisSpacing: 20), //Spacing between horizontally
        children: const [
          Text('1'),
          Text('2'),
          Text('3'),
          Text('4'),
          Text('5'),
          Text('6'),
        ],
      ),
    );
  }
}
