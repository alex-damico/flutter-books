import 'package:json_annotation/json_annotation.dart';

part 'book.g.dart';

@JsonSerializable()
class Book {
  final int? id;
  final String name;
  final String author;
  final String description;
  final String? urlImage;

  Book({this.id, required this.name, required this.author, required this.description, this.urlImage});

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);

  Map<String, dynamic> toJson() => _$BookToJson(this);

  @override
  String toString() {
    return 'Book{id: $id, name: $name, author: $author, description: $description, urlImage: $urlImage}';
  }
}
