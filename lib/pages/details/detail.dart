import 'package:flutter/material.dart';
import 'package:play_store/models/game.dart';
import 'package:play_store/pages/details/widgets/detail_sliver.dart';
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

        final downloads = _formatNumber(game?.download ?? 0);
        final comments = _formatNumber(game?.comment ?? 0);
        final score = formatter.format(game?.score ?? 0);

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
                                    Text(
                                        'Captures d\'écran',
                                        style: Theme.of(context).textTheme.titleLarge,
                                    ),
                                    SizedBox(height: 8),
                                    SizedBox(
                                        height: 200,
                                        child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: game?.images?.length ?? 0,
                                            itemBuilder: (context, index) {
                                                return Padding(
                                                    padding: const EdgeInsets.only(right: 8.0),
                                                    child: ClipRRect(
                                                        borderRadius: BorderRadius.circular(8),
                                                        child: Image.asset(
                                                            game?.images?[index] ?? '',
                                                            width: 300,
                                                            fit: BoxFit.cover,
                                                        ),
                                                    ),
                                                );
                                            },
                                        ),
                                    ),
                                    SizedBox(height: 16),
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
                                    Text('Note', style: TextStyle(fontWeight: FontWeight.bold)),
                                    Row(
                                        children: [
                                            Text(
                                                score,
                                                style: TextStyle(
                                                    fontSize: 50,
                                                    fontWeight: FontWeight.bold,
                                                ),
                                            ),
                                            SizedBox(width: 8),
                                            Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                    Row(
                                                        children: List.generate(
                                                            5,
                                                            (index) => Icon(
                                                                Icons.star,
                                                                color: index < (game?.score ?? 0)
                                                                    ? Colors.amber
                                                                    : Colors.grey,
                                                                size: 20,
                                                            ),
                                                        ),
                                                    ),
                                                    Text(
                                                        '$comments Commentaires',
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            color: Colors.grey,
                                                        ),
                                                    ),
                                                ],
                                            ),
                                            SizedBox(width: 8),
                                        ],
                                    ),
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

