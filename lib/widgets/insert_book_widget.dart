import 'package:books/models/book.dart';
import 'package:books/network/rest_client.dart';
import 'package:books/repositories/book_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

class InsertBookWidget extends StatefulWidget {
  const InsertBookWidget({super.key});

  @override
  State<InsertBookWidget> createState() => _InsertBookWidgetState();
}

class _InsertBookWidgetState extends State<InsertBookWidget> {
  @override
  Widget build(BuildContext context) {
    final log = Logger('InsertBookWidget');
    BookRepository bookRepository = BookRepository(restClient: RestClient(Dio()));

    final formKey = GlobalKey<FormState>();
    String name = "";
    String author = "";
    String description = "";

    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            createTextFormField("Nome", "Inserisci il nome", (value) => {name = value}),
            createTextFormField("Autore", "Inserisci l'autore", (value) => {author = value}),
            createTextFormField("Descrizione", "Inserisci la descrizione", (value) => {description = value}),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    Book createBook = Book(name: name, description: description, author: author);

                    bookRepository.create(createBook).then((_) {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Salvataggio con successo', style: TextStyle(color: Colors.black)),
                            backgroundColor: Colors.green),
                      );
                    }).onError((error, stackTrace) {
                      log.severe(error);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Errore', style: TextStyle(color: Colors.black)), backgroundColor: Colors.red));
                    });
                  }
                },
                child: const Text('Salva'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextFormField createTextFormField(String label, String textError, Function(String value) onSave) {
    return TextFormField(
      decoration: InputDecoration(labelText: label),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return textError;
        }
        return null;
      },
      onSaved: (value) => onSave(value!),
    );
  }
}
