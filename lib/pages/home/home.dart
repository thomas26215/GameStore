import 'package:flutter/material.dart';
import 'package:play_store/pages/home/widgets/header.dart';
import 'package:play_store/pages/home/widgets/search.dart';
import 'package:play_store/pages/home/widgets/category.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF5F67EA),
      body: SingleChildScrollView(
        child: Stack( //Widget pour empiler des items
          children: [
            Transform(transform: Matrix4.identity()..rotateZ(20), // Faire une rotation de mes items à l'intérieur
            origin: const Offset(150, 50),
              child: Image.asset( //Afficher mon image
                'assets/images/bg_liquid.png',
                width: 200,
              ),
            ),
            Positioned( //Permet de position de manière absolu ou relatif un élément
              right: 0, //0 pixel par rapport en haut
              top: 200, //200 pixels par rapport à droite
              child: Transform(transform: Matrix4.identity()..rotateZ(20),
              origin: const Offset(180, 100),
                child: Image.asset(
                  'assets/images/bg_liquid.png',
                  width: 200,
                ), //Afficher une image
              ),
            ),
            Column(
              children: [
                  HeaderSection(),
                  SearchSection(),
                  CategorySection(),
              ],
            ),
          ],
        )
      ),
      bottomNavigationBar: NavigationBar(),
    );
  }
  Widget NavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          label: "home",
          icon: Icon(Icons.home)
        ),
        BottomNavigationBarItem(
          label: "home",
          icon: Icon(Icons.home)
        ),
        BottomNavigationBarItem(
          label: "home",
          icon: Icon(Icons.home)
        ),
        BottomNavigationBarItem(
          label: "home",
          icon: Icon(Icons.home)
        ),
      ],
    );
  }
}

/*

Widget pour scroll :

child: Column(children: [
  Container(
    color: Colors.blue,
    height: 500,
    ),
  Container(
    color: Colors.red,
    height: 500,
    ),
],),

*/
