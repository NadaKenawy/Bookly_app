import 'package:bookly_app/features/search/presentation/manger/search_books_cubit/search_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuildSearchTextField extends StatelessWidget {
  const BuildSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: (bookName) {
        context.read<SearchBooksCubit>().searchBooksByName(bookName);
      },
      decoration: InputDecoration(
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
        hintText: 'Search',
        suffixIcon: IconButton(
          onPressed: () {
            // Optionally handle button press
          },
          icon: const Opacity(opacity: .8, child: Icon(Icons.search)),
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.white),
    );
  }
}
