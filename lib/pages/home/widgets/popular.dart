import 'package:flutter/material.dart';
import 'package:play_store/models/game.dart';
import 'package:play_store/pages/details/detail.dart';

class PopularGames extends StatelessWidget {
  PopularGames({super.key});

  final List<Game> games = Game.games();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DetailPage(game: games[index]),
          )),
          child: Hero(
            tag: 'popular-game-${games[index].id}',
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 10,
              child: Container(
                padding: const EdgeInsets.all(5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(games[index].bgImage),
                ),
              ),
            ),
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: games.length,
      ),
    );
  }
}

