// lib/src/blocks/actions.dart
import 'base.dart';
import 'objects.dart';

class ActionsBlock extends Block {
  final List<BlockElement> elements;

  ActionsBlock({required this.elements}) : super(type: 'actions');

  @override
  Map<String, dynamic> toJson() => {
        'type': type,
        'elements': elements.map((e) => e.toJson()).toList(),
      };
}

// lib/src/blocks/context.dart
class ContextBlock extends Block {
  final List<dynamic> elements; // TextObject or ImageElement

  ContextBlock({required this.elements}) : super(type: 'context');

  @override
  Map<String, dynamic> toJson() => {
        'type': type,
        'elements': elements.map((e) => e.toJson()).toList(),
      };
}

// lib/src/elements/select.dart
class StaticSelectElement extends BlockElement {
  final TextObject placeholder;
  final List<Option> options;
  final String actionId;
  final Option? initialOption;

  StaticSelectElement({
    required String placeholder,
    required this.options,
    required this.actionId,
    this.initialOption,
  })  : placeholder = TextObject.plainText(placeholder),
        super(type: 'static_select');

  @override
  Map<String, dynamic> toJson() => {
        'type': type,
        'placeholder': placeholder.toJson(),
        'options': options.map((o) => o.toJson()).toList(),
        'action_id': actionId,
        if (initialOption != null) 'initial_option': initialOption!.toJson(),
      };
}

// lib/src/objects/option.dart
class Option {
  final TextObject text;
  final String value;
  final String? description;

  Option({
    required String text,
    required this.value,
    String? description,
  })  : text = TextObject.plainText(text),
        description = description != null ? description : null;

  Map<String, dynamic> toJson() => {
        'text': text.toJson(),
        'value': value,
        if (description != null)
          'description': TextObject.plainText(description!).toJson(),
      };
}
