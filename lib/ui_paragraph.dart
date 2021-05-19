import 'dart:ui';
import 'package:flutter/widgets.dart';

class UIParagraph extends LeafRenderObjectWidget {
  final Paragraph paragraph;

  UIParagraph({Key? key, required this.paragraph}) : super(key: key);

  @override
  void updateRenderObject(
    BuildContext context,
    RenderUIParagraph renderObject,
  ) {
    renderObject.paragraph = paragraph;
    super.updateRenderObject(context, renderObject);
  }

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderUIParagraph(paragraph);
  }
}

class RenderUIParagraph extends RenderBox {
  Paragraph paragraph;

  RenderUIParagraph(this.paragraph);

  @override
  void performLayout() {
    if (constraints.hasTightWidth) {
      size = Size(paragraph.width, paragraph.height);
    } else {
      size = Size(paragraph.longestLine, paragraph.height);
    }
  }

  @override
  paint(PaintingContext context, Offset offset) {
    context.canvas.drawParagraph(paragraph, offset);
  }
}