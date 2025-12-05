import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiService {
  final GenerativeModel _model;

  GeminiService()
      : _model = GenerativeModel(
          model: 'models/gemini-2.5-flash', 
          apiKey: 'AIzaSyC7Z1Vaqgh49Prak6jdOTj_h0iWbY8cuUs', 
        );

  Future<String> generateText(String prompt) async {
    try {
      final response = await _model.generateContent([Content.text(prompt)]);
      return response.text ?? '⚠️ No response from Gemini';
    } catch (e) {
      return 'Gemini error: $e';
    }
  }
}
