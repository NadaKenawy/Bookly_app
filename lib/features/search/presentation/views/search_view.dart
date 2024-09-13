import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:bookly_app/features/home/data/repo/home_repo_impl.dart';
import 'package:bookly_app/features/search/presentation/manger/search_books_cubit/search_books_cubit.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/search_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => SearchBooksCubit(getIt.get<HomeRepoImpl>()),
        child: const Scaffold(
          body: SearchViewBody(),
        ),
      ),
    );
  }
}
