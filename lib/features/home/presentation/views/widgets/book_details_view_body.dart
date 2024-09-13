import 'package:bookly_app/core/utils/colors.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/data/model/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/books_actions.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/silmilar_books_list_view.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const CustomBookDetailsAppBar(),
                  const SizedBox(
                    height: 24,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * .2),
                    child: CustomBookItem(
                      imgUrl: bookModel.volumeInfo.imageLinks?.thumbnail ?? '',
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Text(
                    bookModel.volumeInfo.title!,
                    style:
                        Styles.textStyle30.copyWith(fontFamily: kGTSectraFine),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Opacity(
                    opacity: .7,
                    child: Text(
                      bookModel.volumeInfo.authors![0],
                      style: Styles.textStyle18.copyWith(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  BookRating(
                    mainAxisAlignment: MainAxisAlignment.center,
                    rating: bookModel.volumeInfo.averageRating ?? 0,
                    count: bookModel.volumeInfo.ratingsCount ?? 0,
                  ),
                  const SizedBox(
                    height: 36,
                  ),
                  BooksAction(
                    bookModel: bookModel,
                  ),
                  const Expanded(
                    child: SizedBox(
                      height: 48,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'You Can Also Like',
                      style: Styles.textStyle14
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const SilmilarBooksListView(),
                  const SizedBox(
                    height: 40,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
//احسن اني اقسمهم سيكشنز علشان الكود ميطولش معيا بس انا شايفة انه مش طويل عادي ومكسلة
