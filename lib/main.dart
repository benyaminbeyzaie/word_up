import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:word_up/pages/main_page.dart';
import 'package:word_up/pages/on_boarding_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Word Up',
      initialRoute: '/',
      routes: {
        '/': (context) => const MainPage(),
        '/on_boarding': (context) => const OnBoardingPage(),
      },
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
        scaffoldBackgroundColor: const Color.fromARGB(20, 50, 189, 210),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color.fromARGB(255, 174, 36, 240),
          secondary: const Color.fromARGB(255, 50, 189, 210),
        ),
      ),
    );
  }
}
