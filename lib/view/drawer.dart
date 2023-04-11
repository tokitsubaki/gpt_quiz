import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/quiz_summary.dart';
import '../repository/firebase_repository.dart';
import 'history.dart';

class MenuDrawer extends ConsumerStatefulWidget {
  const MenuDrawer({super.key});

  @override
  MenuDrawerState createState() => MenuDrawerState();
}

class MenuDrawerState extends ConsumerState<MenuDrawer> {
  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider.notifier);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const _MenuDrawerHeaderView(),
          if (user.state == null)
            ListTile(
              leading: const Icon(Icons.login),
              title: const Text(
                'サインイン',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              onTap: () => _pressSignIn(context, ref),
            ),
          if (user.state != null)
            ListTile(
              leading: const Icon(Icons.history),
              title: const Text(
                '履歴',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              onTap: () => _pressHistory(context, ref),
            ),
          if (user.state != null)
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text(
                'サインアウト',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              onTap: () => _pressSingOut(context, ref),
            ),
        ],
      ),
    );
  }

  void _pressSignIn(context, ref) async {
    ref.watch(userProvider.notifier).state =
        await ref.read(firebaseProvider).signin();
    Navigator.pop(context);
  }

  void _pressHistory(context, ref) async {
    final User user = ref.read(userProvider.notifier).state!;
    final List<QuizSummary> historyList =
        await ref.read(firebaseProvider).getQuizSummary(user);
    ref.watch(historyProvider.notifier).state = [...historyList];
    Navigator.pop(context);
    Navigator.pushNamed(context, 'history');
  }

  void _pressSingOut(context, ref) async {
    await ref.read(firebaseProvider).signout();
    ref.watch(userProvider.notifier).state = null;
    Navigator.pop(context);
  }
}

class _MenuDrawerHeaderView extends StatelessWidget {
  const _MenuDrawerHeaderView();
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 120,
      child: DrawerHeader(
        decoration: BoxDecoration(color: Colors.blue),
        child: Text(
          'My Menu',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
