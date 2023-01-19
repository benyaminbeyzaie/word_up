import 'package:flutter/material.dart';

import '../widget/w_button.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 300),
              child: Image.asset(
                'assets/first_page_head.png',
                fit: BoxFit.fitWidth,
              ),
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ConstrainedBox(
                    constraints: const BoxConstraints(maxHeight: 100),
                    child: Image.asset('assets/word_up_text.png')),
                Column(
                  children: [
                    WButton(
                        title: 'Get Started!',
                        onPressed: () {
                          Navigator.pushNamed(context, '/on_boarding');
                        }),
                    const SizedBox(height: 5),
                    WButton(
                      title: 'Login',
                      onPressed: () {},
                      backgroundColor: Theme.of(context).colorScheme.primary,
                    ),
                  ],
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
