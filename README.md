# Dart Slack Bot

## Features

- Can use some blocks
- Only need Channel ID and Bot token.

## Getting started

```yml
dependencies:
  dart_slack_bot:
    git: 
      url: https://github.com/mohhh-ok/dart_slack_bot.git
      ref: v0.0.1
```

## Usage

```dart
void main() async {
  final botClient = SlackBotClient(
    channelId: Env.slackChannelId,
    botToken: Env.slackBotToken,
  );

  await botClient.sendMessage(
    text: 'This is fallback text',
    blocks: [
      HeaderBlock(text: '🎉 New Notification'),
      SectionBlock(
        text: TextObject.mrkdwn(
            '*Important Notice*\nHere are the notification details.\n• Item 1\n• Item 2'),
      ),
      DividerBlock(),
      ActionsBlock(
        elements: [
          ButtonElement(
            text: 'View Details',
            value: 'view_details',
            style: 'primary',
          ),
          StaticSelectElement(
            placeholder: 'Select an option',
            actionId: 'select_option',
            options: [
              Option(text: 'Option 1', value: 'opt1'),
              Option(text: 'Option 2', value: 'opt2'),
              Option(text: 'Option 3', value: 'opt3'),
            ],
          ),
        ],
      ),
      ContextBlock(
        elements: [
          TextObject.mrkdwn(
              'Last updated: <!date^1234567890^{date_num} {time_secs}|October 10, 2023>'),
        ],
      ),
    ],
  );
}
```

## License

MIT