import 'package:books/pages/details_page.dart';
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
            leading: book.urlImage != null && book.urlImage!.isNotEmpty
                ? Image.network(book.urlImage!)
                : const FlutterLogo(size: 50),
            title: Text(book.name),
            subtitle: Text(book.author),
            trailing: IconButton(
              icon: const Icon(Icons.arrow_forward),
              tooltip: 'Dettaglio',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailsBook(book: book)),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
