import 'base.dart';
import 'objects.dart';

class ButtonElement extends BlockElement {
  final TextObject text;
  final String value;
  final String? url;
  final String? actionId;
  final String? style;

  ButtonElement({
    required String text,
    required this.value,
    this.url,
    this.actionId,
    this.style,
  })  : text = TextObject.plainText(text),
        super(type: 'button');

  @override
  Map<String, dynamic> toJson() => {
        'type': type,
        'text': text.toJson(),
        'value': value,
        if (url != null) 'url': url,
        if (actionId != null) 'action_id': actionId,
        if (style != null) 'style': style,
      };
}
