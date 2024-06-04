import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../models/book.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: 'http://localhost:8080/books')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('/')
  Future<List<Book>> getBooks();

  @POST('/')
  Future<Book> createBook(@Body() Book book);
}
