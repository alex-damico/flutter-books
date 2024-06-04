import 'package:books/network/rest_client.dart';
import 'package:books/pages/insert_page.dart';
import 'package:books/repositories/book_repository.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:logging/logging.dart';

import '../models/book.dart';
import '../widgets/books_widget.dart';

class HomePage extends StatefulWidget {

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final log = Logger('HomePage');

  @override
  Widget build(BuildContext context) {
    BookRepository bookRepository = BookRepository(restClient: RestClient(Dio()));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Books'),
      ),
      body: FutureBuilder<List<Book>>(
        future: loadData(bookRepository),
        builder: (BuildContext context, AsyncSnapshot<List<Book>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
            return BooksWidget(books: snapshot.data!);
          } else if (snapshot.hasError) {
            return const Center(child: Text("Errore", style: TextStyle(color: Colors.red, fontSize: 50)));
          }

          return const Center(child: Text("Caso non gestito"));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const InsertPage()),
          ).then((_) => setState(() {
            loadData(bookRepository);
          }));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<List<Book>> loadData(BookRepository bookRepository) {
    return bookRepository.getAll();
  }
}
