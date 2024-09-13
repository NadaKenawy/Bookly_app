import 'package:bookly_app/core/utils/app_routes.dart';
import 'package:bookly_app/core/utils/colors.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/data/model/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({
    super.key,
    required this.bookModel,
  });

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(
          AppRouter.kBookDetailsView,
          extra: bookModel,
        );
      },
      child: Container(
        constraints: BoxConstraints(
          maxHeight: 120,
        ),
        child: Row(
          children: [
            CustomBookItem(
              imgUrl: bookModel.volumeInfo.imageLinks?.thumbnail ?? '',
            ),
            const SizedBox(width: 30),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      bookModel.volumeInfo.title ?? 'No Title',
                      style: Styles.textStyle20.copyWith(
                        fontFamily: kGTSectraFine,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    bookModel.volumeInfo.authors?.isNotEmpty == true
                        ? bookModel.volumeInfo.authors!.first
                        : 'Unknown Author',
                    style: Styles.textStyle14,
                  ),
                  const SizedBox(height: 3),
                  Row(
                    children: [
                      Text(
                        'Free',
                        style: Styles.textStyle20.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: BookRating(
                          rating: bookModel.volumeInfo.averageRating ?? 0,
                          count: bookModel.volumeInfo.ratingsCount ?? 0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
