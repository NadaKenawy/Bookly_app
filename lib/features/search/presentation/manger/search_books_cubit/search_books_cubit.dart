import 'package:bookly_app/features/home/data/repo/home_repo.dart';
import 'package:bookly_app/features/search/presentation/manger/search_books_cubit/search_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBooksCubit extends Cubit<SearchBooksState> {
  SearchBooksCubit(this.homeRepo) : super(SearchBooksInitial());

  final HomeRepo homeRepo;

  Future<void> searchBooksByName(String bookName) async {
    emit(SearchBooksLoading());
    var result = await homeRepo.searchBooksByName(bookName: bookName);
    result.fold((failure) {
      emit(SearchBooksFailure(failure.errMessage));
    }, (books) {
      emit(SearchBooksSuccess(books));
    });
  }
}
