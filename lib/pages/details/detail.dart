import 'package:flutter/material.dart';
import 'package:play_store/models/game.dart';
import 'package:play_store/pages/details/widgets/detail_sliver.dart';
import 'package:play_store/other_widgets/rating_bar.dart';
import 'package:readmore/readmore.dart';
import 'package:intl/intl.dart';

class DetailPage extends StatelessWidget {
  final Game? game;
  DetailPage({super.key, this.game});

  final formatter = NumberFormat('0.0', 'fr_FR');

  @override
  Widget build(BuildContext context) {
    if (game == null) {
      return Scaffold(
        body: Center(child: Text('Détails du jeu non disponibles')),
      );
    }

    final downloads = _formatNumber(game!.download);
    final comments = _formatNumber(game!.comment);
    final score = formatter.format(game!.score);

    // Simulating dynamic ratings (each bar gets a random progress for now)
    final List<double> ratingBarsProgress = [
      0.8, // For 1 star
      0.6, // For 2 stars
      0.9, // For 3 stars
      0.7, // For 4 stars
      0.5, // For 5 stars
    ];

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: DetailSliverDelegate(
              game: game,
              expandedHeight: 360,
              roundedContainerHeight: 50,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Jeu info
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 80,
                        height: 80,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.asset(
                            game?.icon ?? 'assets/placeholder.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              game?.name ?? 'Nom non disponible',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              game?.type ?? 'Type de jeu non disponible',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              '$downloads téléchargements',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),

                  // Captures d'écran
                  Text(
                    'Captures d\'écran',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 8),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: game?.images.length ?? 0,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              game?.images[index] ?? '',
                              width: 300,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 16),

                  // Description
                  Text(
                    'Description',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 8),
                  ReadMoreText(
                    game?.description ?? 'Description non disponible',
                    trimLines: 3,
                    colorClickableText: Colors.blue,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Lire plus',
                    trimExpandedText: 'Lire moins',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 16),

                  // Note et barres de notation
                  Text('Note', style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            score,
                            style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: List.generate(
                              5,
                              (index) => Icon(
                                Icons.star,
                                color: index < (game?.score ?? 0)
                                    ? Colors.amber
                                    : Colors.grey,
                                size: 14,
                              ),
                            ),
                          ),
                          Text(
                            '$comments avis',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ],
                      ),
                      SizedBox(width: 15),
                      // Barres de notation avec progression dynamique
                      Column(
                        children: List.generate(
                          5,
                          (index) => Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: RatingBar(percentage: ratingBarsProgress[index]),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),

                  // Barres de notation
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _formatNumber(num number) {
    if (number >= 1000000000) {
      return '${(number / 1000000000).toStringAsFixed(1)}B';
    } else if (number >= 1000000) {
      return '${(number / 1000000).toStringAsFixed(1)}M';
    } else if (number >= 1000) {
      return '${(number / 1000).toStringAsFixed(1)}K';
    } else {
      return number.toString();
    }
  }
}

