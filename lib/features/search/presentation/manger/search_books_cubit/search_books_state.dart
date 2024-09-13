import 'package:bookly_app/features/home/data/model/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

abstract class SearchBooksState extends Equatable {
  const SearchBooksState();

  @override
  List<Object> get props => [];
}

class SearchBooksInitial extends SearchBooksState {}

class SearchBooksLoading extends SearchBooksState {}

class SearchBooksSuccess extends SearchBooksState {
  final List<BookModel> books;

  const SearchBooksSuccess(this.books);

  @override
  List<Object> get props => [books];
}

class SearchBooksFailure extends SearchBooksState {
  final String errMessage;

  const SearchBooksFailure(this.errMessage);

  @override
  List<Object> get props => [errMessage];
}
