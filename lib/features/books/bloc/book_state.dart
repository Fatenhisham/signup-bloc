part of 'book_bloc.dart';


abstract class BookState {}

class BookInitial extends BookState {}

class BookLoading extends BookState {}

class BookLoaded extends BookState {
  final List<Book> books;
  BookLoaded(this.books);
}
class BookUpdated extends BookState {
  final Book book;
  BookUpdated(this.book);
}


class BookError extends BookState {
  final String message;
  BookError(this.message);
}