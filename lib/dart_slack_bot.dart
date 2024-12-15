import 'package:http/http.dart' as http;
import 'dart:convert';
import 'block-kit/index.dart';

export 'block-kit/index.dart';

const String baseUrl = 'https://slack.com/api';

class SlackBotClient {
  final String channelId;
  final String botToken;

  SlackBotClient({
    required this.channelId,
    required this.botToken,
  });

  Future<void> sendMessage({
    required String text,
    List<Block>? blocks,
  }) async {
    final body = {
      'channel': channelId,
      'text': text,
    };

    if (blocks != null) {
      body['blocks'] = jsonEncode(blocks);
    }

    final response = await http.post(
      Uri.parse('$baseUrl/chat.postMessage'),
      headers: {
        'Authorization': 'Bearer $botToken',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(body),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to send message: ${response.body}');
    }
  }
}
