import 'package:bookly_app/core/widgets/custom_error_indicator.dart';

import 'package:bookly_app/core/widgets/cutom_error_widget.dart';

import 'package:bookly_app/features/home/presentation/manger/newest_books_cubit/newset_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/manger/newest_books_cubit/newset_books_state.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsetBooksCubit, NewsetBooksState>(
      builder: (context, state) {
        if (state is NewsetBooksSuccess) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: BookListViewItem(
                    bookModel: state.books[index],
                  ),
                );
              },
              childCount: state.books.length,
            ),
          );
        } else if (state is NewsetBooksFailure) {
          return SliverToBoxAdapter(
            child: CustomErrorWidget(errMessage: state.errMessage),
          );
        } else {
          return SliverToBoxAdapter(
            child: const CustomLoadingIndicator(),
          );
        }
      },
    );
  }
}
