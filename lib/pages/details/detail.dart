import 'package:flutter/material.dart';
import 'package:play_store/models/game.dart';
import 'package:play_store/pages/details/widgets/detail_sliver.dart';
import 'package:play_store/other_widgets/rating_bar.dart';
import 'package:readmore/readmore.dart';
import 'package:intl/intl.dart';

class DetailPage extends StatefulWidget {
  final Game? game;
  DetailPage({super.key, this.game});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> with TickerProviderStateMixin {
  final formatter = NumberFormat('0.0', 'fr_FR');
  bool _isInstalling = false;
  late AnimationController _progressController;
  late Animation<double> _progressAnimation;

  @override
  void initState() {
    super.initState();
    _progressController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5), // Durée simulée de l'installation
    );
    _progressAnimation = Tween<double>(begin: 0, end: 1).animate(_progressController);
    _progressController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _isInstalling = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _progressController.dispose();
    super.dispose();
  }

  void _startInstallation() {
    setState(() {
      _isInstalling = true;
    });
    _progressController.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.game == null) {
      return Scaffold(
        body: Center(child: Text('Détails du jeu non disponibles')),
      );
    }

    final downloads = _formatNumber(widget.game!.download);
    final comments = _formatNumber(widget.game!.comment);
    final score = formatter.format(widget.game!.score);

    final List<double> ratingBarsProgress = [0.8, 0.6, 0.9, 0.7, 0.5];

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: DetailSliverDelegate(
              game: widget.game,
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
                            widget.game?.icon ?? 'assets/placeholder.png',
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
                              widget.game?.name ?? 'Nom non disponible',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              widget.game?.type ?? 'Type de jeu non disponible',
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
                      itemCount: widget.game?.images.length ?? 0,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              widget.game?.images[index] ?? '',
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
                    widget.game?.description ?? 'Description non disponible',
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
                                color: index < (widget.game?.score ?? 0)
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
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16),
        child: _isInstalling
          ? AnimatedBuilder(
              animation: _progressAnimation,
              builder: (context, child) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    LinearProgressIndicator(
                      value: _progressAnimation.value,
                      backgroundColor: Colors.grey[300],
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Installation en cours... ${(_progressAnimation.value * 100).toInt()}%',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                );
              },
            )
          : ElevatedButton(
              child: Text('Installer'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: _startInstallation,
            ),
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

