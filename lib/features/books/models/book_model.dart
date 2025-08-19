class Book {
  final String id;
  final String title;
  final String author;
  final String category;
  final double price;
  final String imageUrl;
  final String description;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.category,
    required this.price,
    required this.imageUrl,
    this.description='',
  });

  factory Book.fromMap(Map<String, dynamic> map, String documentId) {
    return Book(
      id: documentId,
      title: map['title'] ?? '',
      author: map['author'] ?? '',
      category: map['category'] ?? '',
      price: (map['price'] ?? 0).toDouble(),
      imageUrl: map['imageUrl'] ?? '',
      description: map['description'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'author': author,
      'category': category,
      'price': price,
      'imageUrl': imageUrl,
      'description': description,
    };
  }
   Book copyWith({
    String? title,
    String? author,
    String? category,
    double? price,
    String? imageUrl,
    String? description,
  }) {
    return Book(
      id: id, 
      title: title ?? this.title,
      author: author ?? this.author,
      category: category ?? this.category,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      description: description ?? this.description,
    );
  }

}
