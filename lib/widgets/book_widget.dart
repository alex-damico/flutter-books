import 'package:flutter/material.dart';

import '../models/book.dart';

class BookWidget extends StatelessWidget {
  final Book book;

  const BookWidget({required this.book, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          ListTile(
            leading: book.urlImage != null ? Image.network(book.urlImage!) : const FlutterLogo(size: 50),
            title: Text(book.name),
            subtitle: Text(book.author),
            trailing: const Icon(Icons.arrow_forward),
          ),
        ],
      ),
    );
  }
}
