import 'package:google_generative_ai/google_generative_ai.dart';

class TextGenerator {
  final GenerativeModel model;

  TextGenerator(String apiKey)
      : model = GenerativeModel(apiKey: apiKey, model: 'models/gemini-pro');

  Future<String?> generateText(String prompt) async {
    try {
      
      final content = [Content.text(prompt)];
      final result = await model.generateContent(content);
      return result.text;
    } catch (e) {
      throw Exception('Failed to generate text: $e');
    }
  }
}
