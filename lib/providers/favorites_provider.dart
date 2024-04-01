import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:odev4/models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]);

  void toggleMealFavorite(Meal meal) {
    if (state.contains(meal)) {
      state = state.where((element) => element.id != meal.id).toList();
    } else {
      state = [...state, meal];
    }
  }
}

final favoriteMealsProvider =
// => stateprovider'a hangi notifier'ın temsil ettiğini yazdıktan sonra hangi değer alacağı yazılmalıdır.
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>(
        (ref) => FavoriteMealsNotifier());
