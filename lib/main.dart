import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gpt_quiz/view/history.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'firebase/firebase_options.dart';
import 'view/answer.dart';
import 'view/menu.dart';
import 'view/question.dart';
import 'view/summary.dart';
import 'view/top.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(
    child: GptQuiz(),
  ));
}

final appNameProvider = Provider((ref) => 'GPT Quiz');

class GptQuiz extends ConsumerWidget {
  const GptQuiz({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ref.watch(appNameProvider),
      initialRoute: 'top',
      routes: {
        'top': (context) => const Top(),
        'menu': (context) => const Menu(),
        'question': (context) => const Question(),
        'answer': (context) => const Answer(),
        'summary': (context) => const Summary(),
        'history': (context) => const History(),
      },
    );
  }
}
