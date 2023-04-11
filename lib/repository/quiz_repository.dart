import 'dart:convert';
import 'dart:math' as math;

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gpt_quiz/model/enum/quiz_category.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../model/quiz.dart';

class QuizRepository {
  /// クイズを取得する
  Future<Quiz> fetchQuiz(QuizCategory category) async {
    final String apiKey = dotenv.get('OPENAI_API_KEY', fallback: '');
    final quiz = (apiKey.isNotEmpty)
        ? await _fetchGptQuiz(category, apiKey)
        : await _fetchGptQuizFromFile();
    return quiz;
  }

  /// GPTよりクイズを取得する
  Future<Quiz> _fetchGptQuiz(QuizCategory category, String apiKey) async {
    final dio = Dio();
    const url = 'https://api.openai.com/v1/chat/completions';
    String template =
        await rootBundle.loadString('assets/template/gpt_request.txt');
    final formatter = DateFormat.yMMMMd('en_US');
    template = template
        .replaceAll('#{category}', category.enName)
        .replaceAll('#{today}', formatter.format(DateTime.now()));

    final options = Options(
      method: 'post',
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $apiKey",
      },
    );
    final data = {
      "model": "gpt-3.5-turbo",
      "messages": [
        {"role": "system", "content": "You are an excellent quiz master."},
        {"role": "user", "content": template}
      ],
      "temperature": 1.1,
    };
    try {
      final response = await dio.post(url, options: options, data: data);
      Map<String, dynamic> responseData = response.data;
      // Translation が付いてくることがあるのでjson部分のみを取得
      final jsonStr = responseData['choices'][0]['message']['content']
          .toString()
          .replaceAll(RegExp(r'\n|\r'), '');
      final exp = RegExp(r'\{.*?\}');
      final json = exp.firstMatch(jsonStr)![0]!;
      final quiz = Quiz.fromJson(jsonDecode(json));
      return quiz;
    } catch (e) {
      debugPrint(e.toString());
      throw Error();
    }
  }

  /// ファイルよりクイズを取得する
  Future<Quiz> _fetchGptQuizFromFile() async {
    var json = jsonDecode(await rootBundle.loadString('assets/json/quiz.json'));
    try {
      List<Quiz> quizList =
          json.map<Quiz>((data) => Quiz.fromJson(data)).toList();
      int index = math.Random().nextInt(quizList.length);
      return quizList[index];
    } catch (e) {
      throw Error();
    }
  }
}

final quizRepository = Provider((ref) => QuizRepository());
