import 'package:flutter/material.dart';
import 'package:odev4/models/meal.dart';

class FavoritesCard extends StatelessWidget {
  const FavoritesCard({super.key, required this.meal});
  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(meal.imageUrl),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    margin: const EdgeInsets.only(left: 25, right: 25),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: const Color.fromARGB(130, 0, 0, 0)),
                    child: Center(
                        child: Text(
                      meal.name,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
