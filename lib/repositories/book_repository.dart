import 'package:books/models/book.dart';
import 'package:books/network/rest_client.dart';

class BookRepository {
  final RestClient restClient;

  BookRepository({required this.restClient});

  Future<List<Book>> getAll() => restClient.getBooks();

  Future<Book> create(Book book) => restClient.createBook(book);
}