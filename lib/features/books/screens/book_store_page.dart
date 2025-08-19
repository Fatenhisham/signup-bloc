// import 'package:first_firebase/core/bottom_nav.dart';
import 'package:first_firebase/features/books/screens/book_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import '../models/book_model.dart';
import '../bloc/book_bloc.dart';

class BooksPage extends StatelessWidget {
  const BooksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocBuilder<BookBloc, BookState>(
          builder: (context, state) {
            if (state is BookLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is BookLoaded) {
              if (state.books.isEmpty) {
                return const Center(child: Text('No books found.'));
              }
              return ListView.builder(
                itemCount: state.books.length,
                itemBuilder: (context, index) {
                  final book = state.books[index];
                  return Card(
                    margin: const EdgeInsets.all(8),
                    elevation: 4,
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => BookDetailsPage(book: book),
                          ),
                        );
                      },
                      leading:
                          book.imageUrl.isNotEmpty
                              ? Image.network(
                                book.imageUrl,
                                width: 60,
                                height: 80,
                                
                              )
                              : const Icon(Icons.book, size: 50),
                      title: Text(
                        book.title,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Author: ${book.author}'),
                          Text('Category: ${book.category}'),
                          Text('Price: \$${book.price.toStringAsFixed(2)}'),
                        ],
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          context.read<BookBloc>().add(
                            DeleteBookEvent(book.id),
                          );
                        },
                      ),
                    ),
                  );
                },
              );
            } else if (state is BookError) {
              return Center(child: Text(state.message));
            }
            return const SizedBox();
          },
        ),
      ],
    );
  }
}
