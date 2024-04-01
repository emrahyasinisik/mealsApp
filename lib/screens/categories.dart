import 'package:flutter/material.dart';
import 'package:odev4/data/category_data.dart';
import 'package:odev4/models/category.dart';
import 'package:odev4/screens/favorites.dart';
import 'package:odev4/screens/meals.dart';
import 'package:odev4/widgets/category_card.dart';

// Global State - Global State Management
class Categories extends StatelessWidget {
  const Categories({super.key});

  void _changeScreen(BuildContext context, Category c) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Meals(category: c),
      ),
    );
  }

  // * => Context objesi StatlessWidgetlarda yalnızca build fonksiyonu içerisinde erişime açıktır.
  // => Stateful Widgetlarda ise, build fonksiyonu dışından da erişilebilir.
  @override
  Widget build(BuildContext context) {
    const List<Category> categoryList = categories;

    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      appBar: AppBar(
        centerTitle: true, // Başlığı ortala
        title: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.amberAccent, // Çerçeve iç rengi
            border: Border.all(
              color: Colors.black, // Çerçeve rengi
              width: 2, // Çerçeve kalınlığı
            ),
            borderRadius:
                BorderRadius.circular(12), // Çerçeve kenar yuvarlaklığı
          ),
          child: const Text(
            "Restaurant Menu",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black, // Yazı rengi
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (ctx) => const Favorites()));
            },
            icon: const Stack(
              alignment: Alignment.center,
              children: [
                // Dış çerçeve (kalp simgesi)
                Icon(
                  Icons.favorite_border,
                  color: Colors.black, // Dış çerçeve rengi siyah
                  size: 30, // Dış çerçevenin boyutu
                ),
                // İç kısım (kalp simgesi)
                Icon(
                  Icons.favorite,
                  color: Colors.amberAccent, // İç kısım rengi mor
                  size: 25, // İç kısmın boyutu
                ),
              ],
            ),
          )
        ],
      ),
      body: GridView(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 50,
            mainAxisSpacing: 50,
            childAspectRatio: 1),
        children: categoryList
            .map((e) => CategoryCard(
                  category: e,
                  onCategoryClick: () {
                    //Navigator.of(context)
                    //Theme.of(context)
                    //Localizations.of(context)
                    _changeScreen(context, e);
                  },
                ))
            .toList(),
      ),
    );
  }
}
