import 'package:flutter/material.dart';

import '../models/book.dart';

class BooksWidget extends StatelessWidget {
  final List<Book> books;

  const BooksWidget({required this.books, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: books.length,
      itemBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: 50,
          child: Center(child: Text('Name ${books[index].name}')),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
