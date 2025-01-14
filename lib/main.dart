import 'package:flutter/material.dart';
import 'package:sitemate_test/page/search_page/search_page.dart';

void main() {
  runApp(const Sitemate());
}

class Sitemate extends StatelessWidget {
  const Sitemate({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sitemate Challenge',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const SearchPage(),
    );
  }
}
