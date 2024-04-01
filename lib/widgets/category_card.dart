import 'package:flutter/material.dart';
import 'package:odev4/models/category.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.category,
    required this.onCategoryClick,
  });

  final Category category;
  final void Function() onCategoryClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onCategoryClick();
      },
      child: Column(
        children: [
          Container(
            height: 130,
            width: 130,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black, // Çerçeve rengi
                width: 1.5, // Çerçeve kalınlığı
              ),
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(
                    category.imageUrl), // Resim URL'si burada kullanılıyor
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            category.name,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
