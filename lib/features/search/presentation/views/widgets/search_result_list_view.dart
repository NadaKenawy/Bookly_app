import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/core/widgets/cutom_error_widget.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_list_view_item.dart';
import 'package:bookly_app/features/search/presentation/manger/search_books_cubit/search_books_cubit.dart';
import 'package:bookly_app/features/search/presentation/manger/search_books_cubit/search_books_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBooksCubit, SearchBooksState>(
      builder: (context, state) {
        if (state is SearchBooksLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is SearchBooksSuccess) {
          if (state.books.isEmpty) {
            return const Center(
                child: Text('No results found.', style: Styles.textStyle16));
          }
          return ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              final book = state.books[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: BookListViewItem(bookModel: book),
              );
            },
          );
        } else if (state is SearchBooksFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const Center(
              child: Text('No results available. Please try searching.',
                  style: Styles.textStyle16));
        }
      },
    );
  }
}
