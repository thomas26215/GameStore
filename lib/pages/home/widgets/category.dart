import 'package:flutter/material.dart';
import 'package:play_store/pages/home/widgets/popular.dart';
import 'package:play_store/pages/home/widgets/newest.dart';



class CategorySection extends StatelessWidget {
  CategorySection({super.key});

    final categories = [
        {
            'icon': Icons.track_changes_outlined,
            'color': Color(0xFF605CF4),
            'title': 'Arcade',
        },
        {
            'icon': Icons.sports_motorsports_outlined,
            'color': Color(0xFFFC77A6),
            'title': 'Racing',
        },
        {
            'icon': Icons.casino_outlined,
            'color': Color(0xFF4391FF),
            'title': 'Strategy',
        },
        {
            'icon': Icons.sports_esports,
            'color': Color(0xFF7182F2),
            'title': 'More',
        },
    ];

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                SizedBox(
                    height: 140,
                    child: ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: ((context, index) => Column(
                            children: [
                                const SizedBox(height: 25),
                                Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: categories[index]['color'] as Color
                                    ),
                                    child: Icon(
                                        categories[index]['icon'] as IconData,
                                        color: Colors.white,
                                        size: 40,
                                    ),
                                ),
                                const SizedBox(height: 10,),
                                Text(
                                    categories[index]['title'] as String,
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.7),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                    ),
                                )
                            ],
                        )),
                        separatorBuilder: (
                            (context, index) => const SizedBox(width: 20)
                        ),
                        itemCount: categories.length,
                    ),
                ),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: const Text(
                        'Popular games',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                        ),
                    ),
                ),
                PopularGames(),
                Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: const Text(
                    'New games',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                    ),
                ),
            ),
            Newest(),

            ],
        ),
    );
  }
}
