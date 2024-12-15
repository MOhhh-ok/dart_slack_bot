import 'objects.dart';

abstract class Block {
  final String type;
  Block({required this.type});
  Map<String, dynamic> toJson();
}

abstract class BlockElement {
  final String type;
  BlockElement({required this.type});
  Map<String, dynamic> toJson();
}

class SectionBlock extends Block {
  final TextObject text;
  final List<TextObject>? fields;
  final BlockElement? accessory;

  SectionBlock({
    required this.text,
    this.fields,
    this.accessory,
  }) : super(type: 'section');

  @override
  Map<String, dynamic> toJson() => {
        'type': type,
        'text': text.toJson(),
        if (fields != null) 'fields': fields!.map((f) => f.toJson()).toList(),
        if (accessory != null) 'accessory': accessory!.toJson(),
      };
}

class DividerBlock extends Block {
  DividerBlock() : super(type: 'divider');

  @override
  Map<String, dynamic> toJson() => {'type': type};
}

class HeaderBlock extends Block {
  final TextObject text;

  HeaderBlock({required String text})
      : text = TextObject.plainText(text),
        super(type: 'header');

  @override
  Map<String, dynamic> toJson() => {
        'type': type,
        'text': text.toJson(),
      };
}
