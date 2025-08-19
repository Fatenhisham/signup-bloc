part of 'book_bloc.dart';


abstract class BookEvent {}

class LoadBooksEvent extends BookEvent {}

class AddBookEvent extends BookEvent {
  final Book book;
  AddBookEvent(this.book);
}

class DeleteBookEvent extends BookEvent {
  final String bookId;
  DeleteBookEvent(this.bookId);
}

class UpdateBookEvent extends BookEvent {
  final Book book;
  UpdateBookEvent(this.book);
}

