enum QuizCategory {
  tax(id: 1, name: '日本の税金', enName: 'Japanese taxes'),
  history(id: 2, name: 'お金の歴史', enName: 'The history of money'),
  reduction(id: 3, name: '家計の節約', enName: 'Saving Money on Household Expenses');

  const QuizCategory(
      {required this.id, required this.name, required this.enName});

  final int id;
  final String name;
  final String enName;

  String getFullName() {
    return '$name のクイズ';
  }
}

extension QuizCategoryExtension on QuizCategory {
  static QuizCategory getCategory(String id) {
    return QuizCategory.values.singleWhere((e) => e.id.toString() == id);
  }

  static String toCategoryString(QuizCategory category) {
    return category.id.toString();
  }
}
