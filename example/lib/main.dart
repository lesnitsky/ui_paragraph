import 'dart:ui';

import 'package:flutter/material.dart' hide TextStyle;
import 'package:ui_paragraph/ui_paragraph.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final builder = ParagraphBuilder(ParagraphStyle(fontSize: 16));
    builder.addText('hello ');

    builder.pushStyle(TextStyle(color: Colors.red));
    builder.addText('world');
    builder.pop();

    builder.pushStyle(TextStyle(fontWeight: FontWeight.bold));
    builder.addText('!');
    builder.pop();

    final p = builder.build();

    return MaterialApp(
      home: LayoutBuilder(
        builder: (context, constraints) {
          final c = ParagraphConstraints(width: constraints.biggest.width);
          // make sure to call layout manually
          p.layout(c);

          return Center(
            child: UIParagraph(paragraph: p),
          );
        },
      ),
    );
  }
}
