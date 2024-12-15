import '../dart_slack_bot.dart';
import '../env.dart';

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
      ActionsBlock(elements: [
        ButtonElement(text: 'Jump to Google', url: 'https://google.com')
      ]),
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
