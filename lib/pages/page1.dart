import 'package:animate_do/animate_do.dart';
import 'package:animate_do_app/pages/navegacion_page.dart';
import 'package:animate_do_app/pages/twitter_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SlideInLeft(from: 200, child: const Text('Animate_do')),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => const TwitterPage()));
              },
              icon: const FaIcon(FontAwesomeIcons.twitter)),
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => const Page1()));
              },
              icon: const Icon(Icons.arrow_forward_ios))
        ],
      ),
      floatingActionButton: ElasticInRight(
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const NavegacionPage()));
          },
          child: const FaIcon(FontAwesomeIcons.play),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElasticIn(
              delay: const Duration(milliseconds: 1800),
              child: const Icon(
                Icons.new_releases,
                color: Colors.blue,
                size: 90,
              ),
            ),
            FadeInDown(
              delay: const Duration(milliseconds: 400),
              child: const Text('Titulo',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w300)),
            ),
            FadeInDown(
              delay: const Duration(milliseconds: 800),
              child: const Text('Soy un texto pequeño',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300)),
            ),
            FadeInLeft(
                delay: const Duration(milliseconds: 1000),
                child: Container(width: 220, height: 2, color: Colors.blue))
          ],
        ),
      ),
    );
  }
}
