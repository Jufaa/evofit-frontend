import 'package:flutter/material.dart';

class ColumnExample extends StatelessWidget {
  const ColumnExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: (Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('First item'),
            Text('Second item'),
            Text('Third item'),
          ],
        )),
      ),
    );
  }
}
