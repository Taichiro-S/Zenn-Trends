import 'package:dart_openai/dart_openai.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:zenn_trends/pages/recent_article/model/open_ai_state.dart';
import 'package:zenn_trends/pages/recent_article/model/zenn_article_body.dart';

part 'open_ai_provider.g.dart';

@riverpod
class OpenAi extends _$OpenAi {
  @override
  OpenAiState build() {
    return const OpenAiState(summary: AsyncValue.data(''));
  }

  Future<void> summarizeText(
      {required ZennArticleBody article, required String markdown}) async {
    const Map<String, String> models = {
      'gpt4-turbo': 'gpt-4-1106-preview',
      'gpt4-turbo-with-vision': 'gpt-4-vision-preview',
      'gpt4': 'gpt-4',
      'gpt4-32k': 'gpt-4-32k',
    };
    const promptForSummary =
        'summarize the following text as a set of 5 bullet points. output in Japanese and in Markdown style.\n';
    final quizCount = article.bodyLettersCount ~/ 1000;
    const promptForGeneratingQuizOfThreeTypes =
        'Please create three types of quiz in 4-choice format based on the content of the following article of a tech blog. one is for junior engineer, another is for senior engineer and another is something like coding test for programmer. output quiz, 4 choices and explanation of the quiz in Japanese.\n';
    const promptForGeneratingQuizOfBulletPoint =
        'Please create a quiz in 4-choice format based on the content of the following article of a tech blog. the quiz should be for engineers to grasp the bullet points of the article. output quiz, 4 choices and explanation of the quiz in Japanese.\n';
    state = state.copyWith(summary: const AsyncValue.loading());
    print('summarizing...');
    try {
      OpenAIChatCompletionModel chatCompletion =
          await OpenAI.instance.chat.create(
        model: 'gpt-4-1106-preview',
        messages: [
          OpenAIChatCompletionChoiceMessageModel(
            content: '$promptForGeneratingQuizOfBulletPoint\n$markdown',
            role: OpenAIChatMessageRole.user,
          ),
        ],
      );
      print('summarized!');
      print(chatCompletion.choices.first.message.content);
      state = state.copyWith(
          summary:
              AsyncValue.data(chatCompletion.choices.first.message.content));
    } catch (e) {
      // Handle exceptions
      print('Error: $e');
    }
  }
}
