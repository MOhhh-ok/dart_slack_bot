import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'SLACK_BOT_TOKEN', obfuscate: true)
  static String slackBotToken = _Env.slackBotToken;

  @EnviedField(varName: 'SLACK_CHANNEL_ID', obfuscate: true)
  static String slackChannelId = _Env.slackChannelId;
}
