import 'package:flutter/material.dart';

class RatingBar extends StatelessWidget {
  final double percentage; // % de remplissage (ex: 0.7 pour 70%)
  
  RatingBar({required this.percentage});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Barre de fond (grise)
        Container(
          height: 8,
          width: 200,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        // Barre remplie (colorée selon le pourcentage)
        Container(
          height: 8,
          width: 200 * percentage, // Remplit selon le % donné
          decoration: BoxDecoration(
            color: Colors.amber, // Couleur du remplissage
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ],
    );
  }
}

