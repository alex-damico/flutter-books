import 'package:flutter/material.dart';

import '../models/book.dart';

class DetailsBook extends StatelessWidget {
  final Book book;

  const DetailsBook({required this.book, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Books'),
        ),
        body: Center(
          child: Card(
            margin: const EdgeInsets.all(20),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  book.urlImage != null && book.urlImage!.isNotEmpty
                      ? Image.network(book.urlImage!)
                      : const FlutterLogo(size: 50),
                  const SizedBox(height: 10),
                  Text(book.name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Text(book.description),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      IconButton(
                        iconSize: 20,
                        icon: const Icon(
                          Icons.favorite_outlined,
                        ),
                        onPressed: () {},
                      ),
                      const SizedBox(width: 8),
                      IconButton(
                        iconSize: 20,
                        icon: const Icon(
                          Icons.add_reaction,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
