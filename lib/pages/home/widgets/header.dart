import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only( //Permet de spécifier des marges uniquement sur certains côtés (ontraire de EdgeInsets.all, qu met une marge uniforme sur tous les côtés)
        top: MediaQuery.of(context).padding.top, //Le padding est définit par l'environnement de l'application 
        left: 25,
        right: 25,
      ),
      child: Row( //Affiche en ligne
      mainAxisAlignment: MainAxisAlignment.spaceBetween, //Le premier est aligné au début, le dernier est aligné à la fin, les autres sont espacés de manière uniforme
        children: [ //Eléments de Row
          Column( //Affiche en colonne
            crossAxisAlignment: CrossAxisAlignment.start, //Aligne les enfants au début
            children: const [ //Eléments de Column
              Text("Welcome",
              style: TextStyle( //Affiche du texte
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 5,),
              Text("What would you like to play",
              style: TextStyle( //Affiche du texte
                fontSize: 19,
                color: Colors.white,
                ),
              ),
            ],
          ),
          CircleAvatar( //Affiche un contenu dans un cercle
            child: Image.asset('assets/images/avatar.png'),
          )
        ],
      ),
    );
  }
}