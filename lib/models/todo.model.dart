class TodoModel {
  String id;
  String title;
  String dec;
  bool isCompleted;
  DateTime createdAt;

  TodoModel({
    required this.id,
    required this.title,
    required this.dec,
    this.isCompleted = false,
    DateTime? createdAt,
  }) : this.createdAt = createdAt ?? DateTime.now();

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'] as String,
      title: json['title'] as String,
      dec: json['dec'] as String,
      isCompleted: json['isCompleted'] as bool? ?? false,
      createdAt: DateTime.tryParse(json['createdAt'] ?? '') ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'dec': dec,
      'isCompleted': isCompleted,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}