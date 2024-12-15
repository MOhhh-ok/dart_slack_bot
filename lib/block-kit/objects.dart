class TextObject {
  final String type;
  final String text;
  final bool? emoji;
  final bool? verbatim;

  TextObject.plainText(this.text, {this.emoji = true})
      : type = 'plain_text',
        verbatim = null;

  TextObject.mrkdwn(this.text, {this.verbatim})
      : type = 'mrkdwn',
        emoji = null;

  Map<String, dynamic> toJson() => {
        'type': type,
        'text': text,
        if (emoji != null) 'emoji': emoji,
        if (verbatim != null) 'verbatim': verbatim,
      };
}
