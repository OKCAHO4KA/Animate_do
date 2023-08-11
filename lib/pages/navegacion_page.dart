import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class NavegacionPage extends StatelessWidget {
  const NavegacionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NotificationModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Notification Page'),
          backgroundColor: Colors.lime,
        ),
        floatingActionButton: const BotonFlotante(),
        bottomNavigationBar: const BottomNavigation(),
      ),
    );
  }
}

class BotonFlotante extends StatelessWidget {
  const BotonFlotante({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.lime,
      onPressed: () {
        final pro = Provider.of<_NotificationModel>(context, listen: false);
        pro.numero += 1;

        if (pro.numero >= 2) {
          pro.bounceController.forward(from: 0.0);
        }
      },
      child: const FaIcon(FontAwesomeIcons.play),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<_NotificationModel>(context);
    return BottomNavigationBar(
        backgroundColor: Colors.black,
        currentIndex: 0,
        unselectedItemColor: const Color.fromARGB(255, 80, 79, 79),
        selectedItemColor: Colors.lime,
        items: [
          const BottomNavigationBarItem(
              label: 'Bones',
              icon: FaIcon(
                FontAwesomeIcons.bone,
              )),
          BottomNavigationBarItem(
              label: 'Bell',
              icon: Stack(
                children: [
                  const FaIcon(FontAwesomeIcons.bell),
                  Positioned(
                      top: 0,
                      right: 0,
                      child: BounceInDown(
                        animate: pro.numero > 0 ? true : false,
                        from: 10,
                        child: Bounce(
                          from: 10,
                          controller: (controller) =>
                              pro.bounceController = controller,
                          child: Container(
                            width: 12,
                            height: 12,
                            decoration: const BoxDecoration(
                                color: Colors.lime, shape: BoxShape.circle),
                            alignment: Alignment.center,
                            child: Text(pro.numero.toString(),
                                style: const TextStyle(
                                  fontSize: 8,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                )),
                          ),
                        ),
                      )
                      //  Icon(
                      //   Icons.brightness_1,
                      //   size: 10,
                      //   color: Colors.lime,
                      ),
                ],
              )),
          const BottomNavigationBarItem(
              label: 'My perro',
              icon: FaIcon(
                FontAwesomeIcons.dog,
              )),
        ]);
  }
}

class _NotificationModel extends ChangeNotifier {
  int _numero = 0;
  AnimationController? _bounceController;

  AnimationController get bounceController => _bounceController!;

  set bounceController(AnimationController ctr) {
    _bounceController = ctr;
  }

  int get numero => _numero;
  set numero(int valor) {
    _numero = valor;
    notifyListeners();
  }
}
