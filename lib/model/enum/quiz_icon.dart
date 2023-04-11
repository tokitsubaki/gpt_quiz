import 'package:flutter/material.dart';

enum QuizIcon {
  choise_1(id: 1, icon: Icons.looks_one_outlined),
  choise_2(id: 2, icon: Icons.looks_two_outlined),
  choise_3(id: 3, icon: Icons.looks_3_outlined),
  choise_4(id: 4, icon: Icons.looks_4_outlined);

  const QuizIcon({required this.id, required this.icon});

  final int id;
  final IconData icon;

  static IconData getIconById(int id) {
    return QuizIcon.values.firstWhere((e) => e.id == id).icon;
  }
}
