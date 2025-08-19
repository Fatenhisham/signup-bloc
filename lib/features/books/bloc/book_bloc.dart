import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
import 'package:first_firebase/features/books/data/books_repository.dart';
import '../models/book_model.dart';

part 'book_event.dart';
part 'book_state.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  final BookRepository bookRepository;

  BookBloc({required this.bookRepository}) : super(BookInitial()) {
    on<LoadBooksEvent>(_onLoadBooks);
    on<AddBookEvent>(_onAddBook);
    on<DeleteBookEvent>(_onDeleteBook);
    on<UpdateBookEvent>(_onUpdateBook); 
    on<_BooksUpdatedEvent>(_onBooksUpdated);
  }

  void _onLoadBooks(LoadBooksEvent event, Emitter<BookState> emit) {
    emit(BookLoading());
    bookRepository.getBooks().listen((books) {
      add(_BooksUpdatedEvent(books));
    });
  }

  void _onAddBook(AddBookEvent event, Emitter<BookState> emit) async {
    await bookRepository.addBook(event.book);
  }

  void _onDeleteBook(DeleteBookEvent event, Emitter<BookState> emit) async {
    await bookRepository.deleteBook(event.bookId);
  }

  Future<void> _onUpdateBook(
    UpdateBookEvent event,
    Emitter<BookState> emit,
  ) async {
    try {
      await bookRepository.updateBook(event.book);
     
      add(LoadBooksEvent());
    } catch (e) {
      emit(BookError("Failed to update book: $e"));
    }
  }

  void _onBooksUpdated(_BooksUpdatedEvent event, Emitter<BookState> emit) {
    emit(BookLoaded(event.books));
  }
}

class _BooksUpdatedEvent extends BookEvent {
  final List<Book> books;
  _BooksUpdatedEvent(this.books);
}
