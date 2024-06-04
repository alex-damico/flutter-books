import 'package:books/pages/home_page.dart';
import 'package:books/widgets/insert_book_widget.dart';
import 'package:flutter/material.dart';

class InsertPage extends StatelessWidget {
  const InsertPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Books'),
      ),
      body: InsertBookWidget(),
    );
  }
}
