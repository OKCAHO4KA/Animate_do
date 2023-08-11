import 'package:animate_do_app/pages/navegacion_page.dart';
import 'package:animate_do_app/pages/page1.dart';
// import 'package:animate_do_app/pages/page1.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Animate_do App',
        home: Page1());
  }
}
