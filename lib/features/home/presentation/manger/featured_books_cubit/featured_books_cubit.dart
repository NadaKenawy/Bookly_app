import 'package:bookly_app/features/home/data/model/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repo/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'featured_books_state.dart';

class FeatuerdBooksCubit extends Cubit<FeatuerdBooksState> {
  FeatuerdBooksCubit(this.homeRepo) : super(FeatuerdBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchFeaturedBooks() async {
    emit(FeatuerdBooksLoading());
    var result = await homeRepo.fetchFeaturedBooks();
    result.fold((failure) {
      emit(FeatuerdBooksFailure(failure.errMessage));
    }, (books) {
      emit(FeatuerdBooksSuccess(books));
    });
  }
}
