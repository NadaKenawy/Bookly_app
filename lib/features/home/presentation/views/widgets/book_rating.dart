import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
    required this.rating,
    required this.count,
  });
  final MainAxisAlignment mainAxisAlignment;
  final num rating;
  final int count;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Icon(
          FontAwesomeIcons.solidStar,
          color: Colors.yellow,
          size: 14,
        ),
        SizedBox(
          width: 8,
        ),
        Text(
          rating.toString(),
          style: Styles.textStyle16,
        ),
        SizedBox(
          width: 6,
        ),
        Opacity(
          opacity: .5,
          child: Text(
            '($count)',
            style: Styles.textStyle14,
          ),
        ),
      ],
    );
  }
}
