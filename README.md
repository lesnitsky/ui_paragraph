# ui_paragraph

[![lesnitsky.dev](https://lesnitsky.dev/shield.svg?hash=71058)](https://lesnitsky.dev?utm_source=ui_paragraph)
[![GitHub stars](https://img.shields.io/github/stars/lesnitsky/ui_paragraph.svg?style=social)](https://github.com/lesnitsky/ui_paragraph)
[![Twitter Follow](https://img.shields.io/twitter/follow/lesnitsky_dev.svg?label=Follow%20me&style=social)](https://twitter.com/lesnitsky_dev)

Flutter widget which render paragraphs from dart:ui

## Installation

pubspec.yaml:

```yaml
dependencies:
  ui_paragraph: ^1.0.0
```


## Example

```dart
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

```


## License

MIT
