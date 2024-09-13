import 'package:bookly_app/core/widgets/custom_error_indicator.dart';
import 'package:bookly_app/core/widgets/cutom_error_widget.dart';
import 'package:bookly_app/features/home/presentation/manger/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:bookly_app/core/utils/app_routes.dart'; // Import the route constants

class SilmilarBooksListView extends StatelessWidget {
  const SilmilarBooksListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .15,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final book = state.books[index];
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6),
                  child: GestureDetector(
                    onTap: () {
                      GoRouter.of(context).pushReplacement(
                        AppRouter.kBookDetailsView,
                        extra: book,
                      );
                    },
                    child: CustomBookItem(
                      imgUrl: book.volumeInfo.imageLinks?.thumbnail ?? '',
                    ),
                  ),
                );
              },
              itemCount: state.books.length,
            ),
          );
        } else if (state is SimilarBooksFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
