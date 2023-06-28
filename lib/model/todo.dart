//import 'package:swim_application/utils.dart';
class Todo {
  String title;
  String id;
  String description;
  bool isDone;

  Todo({
    required this.title,
    this.description = '',
    required this.id,
    this.isDone = false,
  });

  static Todo fromJson(Map<String, dynamic> json) => Todo(
        title: json['title'],
        description: json['description'],
        id: json['id'],
        isDone: json['isDone'],
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'id': id,
        'isDone': isDone,
      };
}
