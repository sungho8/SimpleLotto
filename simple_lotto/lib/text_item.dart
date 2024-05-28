import 'dart:math';

import 'package:flutter/material.dart';

class TextItem extends StatefulWidget {
  final int counter;

  const TextItem({Key? key, required this.counter}) : super(key: key);

  @override
  State<TextItem> createState() => _TextItemState();
}

class _TextItemState extends State<TextItem> {
  final random = Random();

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: Text(
        "${widget.counter}",
        key: ValueKey<int>(widget.counter),
        style: TextStyle(
          fontSize: 24,
          color: Color.fromRGBO(
            random.nextInt(256),
            random.nextInt(256),
            random.nextInt(256),
            1.0,
          ),
        ),
      ),
    );
  }
}
