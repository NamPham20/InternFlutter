class Todo {
  int id;
  String title;
  String createTime;
  String? updateTime;

  Todo({this.id=0,required this.title, required this.createTime  , this.updateTime});



  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      id: map['id'],
      title: map['title'],
      createTime: map['create_time'],
      updateTime: map['update_time'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'create_time': createTime,
      'update_time': updateTime,
    };
  }

}