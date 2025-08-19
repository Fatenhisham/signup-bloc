import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/book_model.dart';
class BookRepository {
  final FirebaseFirestore firestore;

  BookRepository({required this.firestore});

  Stream<List<Book>> getBooks() {
    return firestore.collection('books').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Book.fromMap(doc.data(), doc.id);
      }).toList();
    });
  }

  Future<void> addBook(Book book) async {
    await firestore.collection('books').add(book.toMap());
  }

  Future<void> deleteBook(String id) async {
    await firestore.collection('books').doc(id).delete();
  }
  
  Future<void> updateBook(Book book) async {
  await firestore.collection('books').doc(book.id).update(book.toMap());
}

}