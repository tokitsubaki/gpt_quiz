import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:gpt_quiz/model/quiz_summary.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FirebaseRepository {
  /// Authenticationへログイン
  Future<User?> signin() async {
    GoogleSignInAccount? account = await GoogleSignIn(scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ]).signIn();

    if (account == null) {
      return null;
    }

    GoogleSignInAuthentication auth = await account.authentication;
    final credential = GoogleAuthProvider.credential(
      idToken: auth.idToken,
      accessToken: auth.accessToken,
    );
    User? user =
        (await FirebaseAuth.instance.signInWithCredential(credential)).user;
    return user;
  }

  /// Authenticationからログアウト
  Future<void> signout() async {
    await FirebaseAuth.instance.signOut();
  }

  /// FireStoreへ結果を保存
  void storeQuizSummary(User user, QuizSummary summary) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .collection('history')
        .add(summary.toJson());
  }

  /// FireStoreから結果を取得
  Future<List<QuizSummary>> getQuizSummary(User user) async {
    final data = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .collection('history')
        .orderBy('completedTime')
        .get();
    final quizSummary =
        data.docs.map((e) => QuizSummary.fromJson(e.data())).toList();
    return quizSummary;
  }
}

final firebaseProvider = Provider((ref) => FirebaseRepository());
final userProvider =
    StateProvider<User?>((ref) => FirebaseAuth.instance.currentUser);
