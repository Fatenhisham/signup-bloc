import 'package:first_firebase/features/books/bloc/book_bloc.dart';
import 'package:first_firebase/features/books/models/book_model.dart';
import 'package:first_firebase/features/books/screens/book_store_page.dart';
import 'package:first_firebase/features/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  final List<Widget> pages = [const BooksPage(), const ProfileScreen()];

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final titleController = TextEditingController();
    final authorController = TextEditingController();
    final categoryController = TextEditingController();
    final priceController = TextEditingController();
    final imageUrlController = TextEditingController();

    void _showAddBookDialog() {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Add New Book'),
            content: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: titleController,
                      decoration: const InputDecoration(labelText: 'Title'),
                      validator:
                          (value) =>
                              value == null || value.isEmpty
                                  ? "Enter title"
                                  : null,
                    ),
                    TextFormField(
                      controller: authorController,
                      decoration: const InputDecoration(labelText: 'Author'),
                      validator:
                          (value) =>
                              value == null || value.isEmpty
                                  ? "Enter author"
                                  : null,
                    ),
                    TextFormField(
                      controller: categoryController,
                      decoration: const InputDecoration(labelText: 'Category'),
                      validator:
                          (value) =>
                              value == null || value.isEmpty
                                  ? "Enter category"
                                  : null,
                    ),
                    TextFormField(
                      controller: priceController,
                      decoration: const InputDecoration(labelText: 'Price'),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter price";
                        }
                        if (double.tryParse(value) == null) {
                          return "Enter valid number";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: imageUrlController,
                      decoration: const InputDecoration(labelText: 'Image URL'),
                      validator:
                          (value) =>
                              value == null || value.isEmpty
                                  ? "Enter image URL"
                                  : null,
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final book = Book(
                      id: '',
                      title: titleController.text,
                      author: authorController.text,
                      category: categoryController.text,
                      price: double.tryParse(priceController.text) ?? 0.0,
                      imageUrl: imageUrlController.text,
                    );
                    context.read<BookBloc>().add(AddBookEvent(book));
                    Navigator.pop(context);
                  }
                },
                child: const Text('Add'),
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(currentIndex == 0 ? 'Books' : 'Profile'),
        centerTitle: true,
      ),
      body: pages[currentIndex],
      floatingActionButton:
          currentIndex == 0
              ? Positioned(
                bottom: 16,
                right: 16,
                child: FloatingActionButton(
                  onPressed: _showAddBookDialog,
                  child: const Icon(Icons.add),
                ),
              )
              : null,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        backgroundColor: const Color(0xff9A392C),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.book, size: 25),
            label: 'Books',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 25),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
