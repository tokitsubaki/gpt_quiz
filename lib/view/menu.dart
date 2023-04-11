import 'package:flutter/material.dart';
import 'package:gpt_quiz/main.dart';
import 'package:gpt_quiz/model/enum/quiz_category.dart';
import 'package:gpt_quiz/notifier/quiz_summary_notifier.dart';
import 'package:gpt_quiz/view/drawer.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/enum/quiz_icon.dart';

class Menu extends ConsumerStatefulWidget {
  const Menu({super.key});

  @override
  MenuState createState() => MenuState();
}

final quizCategoryProvider = StateProvider((ref) => QuizCategory.history);

class MenuState extends ConsumerState<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ref.watch(appNameProvider)),
      ),
      endDrawer: const MenuDrawer(),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            const Padding(padding: EdgeInsets.only(top: 50)),
            const Text(
              '挑戦したいクイズを選択してください',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 50)),
            for (final quizCategory in QuizCategory.values) ...{
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size.fromWidth(double.maxFinite),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                icon: Icon(
                  QuizIcon.getIconById(quizCategory.id),
                  size: 30,
                ),
                label: Text(
                  quizCategory.getFullName(),
                  style: const TextStyle(fontSize: 30),
                ),
                onPressed: () => _onPressQuiz(context, ref, quizCategory),
              ),
              const Padding(padding: EdgeInsets.only(top: 30)),
            }
          ],
        ),
      ),
    );
  }

  void _onPressQuiz(context, ref, selectedCategory) {
    ref.read(quizCategoryProvider.notifier).state = selectedCategory;
    ref.read(quizSummaryProvider.notifier).setCategory(selectedCategory);
    Navigator.pushNamedAndRemoveUntil(context, 'question', (_) => false);
  }
}
