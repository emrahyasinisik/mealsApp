import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:odev4/providers/favorites_provider.dart';
import 'package:odev4/widgets/favorites_card.dart';
import 'package:odev4/widgets/meal_card.dart';

class Favorites extends ConsumerStatefulWidget {
  const Favorites({super.key});

  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends ConsumerState<Favorites> {
  @override
  Widget build(BuildContext context) {
    final favorites = ref.watch(favoriteMealsProvider);
    Widget widget = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisSpacing: 15,
          childAspectRatio: 3 / 2,
        ),
        itemBuilder: (ctx, index) => FavoritesCard(meal: favorites[index]),
        itemCount: favorites.length,
      ),
    );

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.amber,
              border: Border.all(
                color: Colors.black,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              "Favoriler",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: widget);
  }
}
