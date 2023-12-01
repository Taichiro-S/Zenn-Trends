import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'NOTION_API_KEY')
  static const String notionApiKey = _Env.notionApiKey;
  @EnviedField(varName: 'NOTION_OAUTH_CLIENT_ID')
  static const String notionOauthClientId = _Env.notionOauthClientId;
  @EnviedField(varName: 'NOTION_OAUTH_CLIENT_SECRET')
  static const String notionOauthClientSecret = _Env.notionOauthClientSecret;
  @EnviedField(varName: 'NOTION_OAUTH_URL')
  static const String notionOauthUrl = _Env.notionOauthUrl;
  @EnviedField(varName: 'OPENAI_API_KEY')
  static const String openaiApiKey = _Env.openaiApiKey;
}
