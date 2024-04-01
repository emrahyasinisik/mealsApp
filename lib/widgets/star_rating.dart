import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final double rating;
  final double size;
  final Color color;

  const StarRating({
    super.key,
    required this.rating,
    this.size = 24,
    this.color = Colors.amber,
  });

  @override
  Widget build(BuildContext context) {
    // Rating'i 0 ile 5 arasına sınırla
    double normalizedRating = rating.clamp(0, 5);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        // Her yıldızın tam dolu, yarı dolu veya boş olup olmadığını belirle
        if (index < normalizedRating.floor()) {
          // Yıldız tam dolu
          return Icon(
            Icons.star_rounded,
            size: size,
            color: color,
          );
        } else if (index == normalizedRating.floor() &&
            normalizedRating != index) {
          // Yıldız yarı dolu
          return Icon(
            Icons.star_half_rounded,
            size: size,
            color: color,
          );
        } else {
          // Yıldız boş
          return Icon(
            Icons.star_border_rounded,
            size: size,
            color: color,
          );
        }
      }),
    );
  }
}
