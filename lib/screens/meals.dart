import 'package:flutter/material.dart';
import 'package:odev4/data/meal_data.dart';
import 'package:odev4/models/category.dart';
import 'package:odev4/models/meal.dart';
import 'package:odev4/widgets/meal_card.dart';

class Meals extends StatelessWidget {
  const Meals({super.key, required this.category});
  final Category category;
  @override
  Widget build(BuildContext context) {
    List<Meal> mealList =
        meals.where((element) => element.categoryId == category.id).toList();

    // ListView
    Widget widget = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // İki sütunlu bir grid
          crossAxisSpacing: 10.0, // Yatay aralık
          mainAxisSpacing: 10.0,
          childAspectRatio: 2 / 2.5,
          // Dikey aralık
        ),
        itemBuilder: (context, index) => MealCard(meal: mealList[index]),
        itemCount: mealList.length,
      ),
    );

    if (mealList.isEmpty) {
      widget = const Center(
        child: Text("Bu kategoride hiç bir yemek bulunamadı."),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      appBar: AppBar(
        centerTitle: true,
        title: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.amber, // Arka plan rengi
            border: Border.all(
              color: Colors.black, // Çerçeve rengi
              width: 2, // Çerçeve kalınlığı
            ),
            borderRadius: BorderRadius.circular(12), // Kenar yuvarlaklığı
          ),
          child: Text(
            "${category.name}",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: widget, // Daha önceden hazırladığınız widget'i kullanın
    );
  }
}
