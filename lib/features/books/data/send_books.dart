import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/book_model.dart';

Future<void> seedBooks(FirebaseFirestore firestore) async {
  List<Book> books = [
    Book(
      id: '', 
      title: 'Atomic Habits',
      author: 'James Clear',
      price: 16.20,
      category: 'Self-help',
      imageUrl: 'https://images-na.ssl-images-amazon.com/images/I/91bYsX41DVL.jpg',
      description:
          'A practical guide to building good habits, breaking bad ones, and mastering tiny behaviors that lead to remarkable results.',
    ),
    Book(
      id: '',
      title: 'The Lean Startup',
      author: 'Eric Ries',
      price: 14.50,
      category: 'Business',
      imageUrl: 'https://images-na.ssl-images-amazon.com/images/I/81-QB7nDh4L.jpg',
      description:
          'Teaches entrepreneurs how to launch startups successfully by using continuous innovation and validated learning.',
    ),
    Book(
      id: '',
      title: 'Clean Code',
      author: 'Robert C. Martin',
      price: 32.00,
      category: 'Programming',
      imageUrl: 'https://images-na.ssl-images-amazon.com/images/I/41xShlnTZTL.jpg',
      description:
          'A must-read for software developers that explains how to write clean, maintainable, and efficient code.',
    ),
    Book(
      id: '',
      title: 'The Subtle Art of Not Giving a F*ck',
      author: 'Mark Manson',
      price: 15.00,
      category: 'Self-help',
      imageUrl: 'https://images-na.ssl-images-amazon.com/images/I/71QKQ9mwV7L.jpg',
      description:
          'Offers unconventional advice on living a better life by focusing on what truly matters and letting go of the rest.',
    ),
    Book(
      id: '',
      title: 'Sapiens: A Brief History of Humankind',
      author: 'Yuval Noah Harari',
      price: 18.00,
      category: 'History',
      imageUrl: 'https://images-na.ssl-images-amazon.com/images/I/713jIoMO3UL.jpg',
      description:
          'Explores the history of humankind, from the Stone Age to the modern era, and how our species came to dominate the world.',
    ),
     Book(
      id: '',
      title: 'Deep Work',
      author: 'Cal Newport',
      price: 17.50,
      category: 'Productivity',
      imageUrl: 'https://m.media-amazon.com/images/I/71g2ednj0JL.jpg',
      description:
          'Guides readers on how to focus deeply and achieve more in less time by eliminating distractions.',
    ),
    Book(
      id: '',
      title: 'Design Patterns: Elements of Reusable Object-Oriented Software',
      author:
          'Erich Gamma, Richard Helm, Ralph Johnson, John Vlissides',
      price: 40.00,
      category: 'Programming',
      imageUrl: 'https://m.media-amazon.com/images/I/81gtKoapHFL.jpg',
      description:
          'A classic programming book that introduces common design patterns for creating reusable software solutions.',
    ),
    Book(
      id: '',
      title: 'Educated',
      author: 'Tara Westover',
      price: 14.99,
      category: 'Memoir',
      imageUrl: 'https://m.media-amazon.com/images/I/81WojUxbbFL.jpg',
      description:
          'A memoir about a woman who grows up in a strict and abusive household in rural Idaho but eventually escapes to learn about the wider world.',
    ),
    Book(
      id: '',
      title: 'The Pragmatic Programmer',
      author: 'Andrew Hunt, David Thomas',
      price: 30.00,
      category: 'Programming',
      imageUrl: 'https://m.media-amazon.com/images/I/518FqJvR9aL.jpg',
      description:
          'Covers practical tips and philosophies for becoming a better software developer.',
    ),
    Book(
      id: '',
      title: 'Thinking, Fast and Slow',
      author: 'Daniel Kahneman',
      price: 20.00,
      category: 'Psychology',
      imageUrl: 'https://m.media-amazon.com/images/I/71aG+xDKSYL.jpg',
      description:
          'Explains the two systems that drive the way we think: the fast, intuitive, and emotional system, and the slow, deliberate, and logical system.',
    ),

  ];

  for (var book in books) {
    await firestore.collection('books').add(book.toMap());
  }
}
