part of 'featured_books_cubit.dart';

sealed class FeatuerdBooksState extends Equatable {
  const FeatuerdBooksState();

  @override
  List<Object> get props => [];
}

final class FeatuerdBooksInitial extends FeatuerdBooksState {}

final class FeatuerdBooksLoading extends FeatuerdBooksState {}

final class FeatuerdBooksFailure extends FeatuerdBooksState {
  final String errMessage;

  const FeatuerdBooksFailure(this.errMessage);
}

final class FeatuerdBooksSuccess extends FeatuerdBooksState {
  final List<BookModel> books;

  const FeatuerdBooksSuccess( this.books);
}
