import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:odev4/providers/favorites_provider.dart';
import 'package:odev4/widgets/star_rating.dart';

import '../models/meal.dart';

class MealDetails extends ConsumerStatefulWidget {
  final Meal meal;
  const MealDetails({super.key, required this.meal});

  @override
  ConsumerState<MealDetails> createState() => _MealDetailsState();
}

class _MealDetailsState extends ConsumerState<MealDetails> {
  @override
  Widget build(BuildContext context) {
    final favorites = ref.watch(favoriteMealsProvider);
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 50,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(30),
                    ),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(widget.meal.imageUrl),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.amber,
                        size: 30,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: IconButton(
                      onPressed: () {
                        ref
                            .read(favoriteMealsProvider.notifier)
                            .toggleMealFavorite(widget.meal);
                      },
                      icon: Container(
                        height: 50,
                        width: 50,
                        decoration: const BoxDecoration(
                            color: Color(0xffF5F5F5), shape: BoxShape.circle),
                        child: Icon(
                          favorites.contains(widget.meal)
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Colors.amber,
                          size: 35,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Expanded(
            flex: 50,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.meal.name,
                    style: const TextStyle(
                      color: Color(0xff565656),
                      fontSize: 27,
                      // fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const StarRating(
                    rating: 4.5,
                    color: Colors.amber,
                    size: 30,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    'İçindekiler',
                    style: TextStyle(
                      color: Color(0xff565656),
                      fontSize: 24,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      height: 0,
                      letterSpacing: 0.96,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    widget.meal.ingredients.join(', '),
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      color: Color(0xff565656),
                      fontSize: 15,
                      fontFamily: 'Poppins',
                      height: 0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
