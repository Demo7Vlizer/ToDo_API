class TodoModel {
  String id;
  String title;
  String dec;
  bool isCompleted;

  TodoModel({
    required this.id,
    required this.title,
    required this.dec,
    this.isCompleted = false,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'] as String,
      title: json['title'] as String,
      dec: json['dec'] as String,
      isCompleted: json['isCompleted'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'dec': dec,
      'isCompleted': isCompleted,
    };
  }
}