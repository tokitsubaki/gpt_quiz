import 'package:flutter/material.dart';

class Top extends StatelessWidget {
  const Top({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GestureDetector(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                  image: AssetImage('assets/img/logo.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(context, 'menu', (_) => false);
            },
          ),
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const <Widget>[
                Center(
                  child: Text(
                    'タップしてください',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 40),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
