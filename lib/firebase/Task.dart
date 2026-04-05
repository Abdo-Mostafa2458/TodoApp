class Task {
  //data Model
  static const String taskCollection = 'tasks';
  String id;
  String title;
  String description;
  DateTime dateTime;
  bool isDone;

  Task(
      {this.id = "",
      required this.title,
      required this.description,
      required this.dateTime,
      this.isDone = false});

  //from fireStore Map=>object object function (Map)

  Task.fromFireStore(Map<String, dynamic> dataJson)
      : this(
            id: dataJson['id'] as String,
            title: dataJson['title'] as String,
            description: dataJson['description'] as String,
            dateTime: DateTime.fromMillisecondsSinceEpoch(dataJson['dateTime'])
                as DateTime,
            isDone: dataJson['isDone'] as bool);

  //to fireStore Map=>object  Map function(object)

  Map<String, dynamic> toFireStore() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'dateTime': dateTime.millisecondsSinceEpoch,
      'isDone': isDone
    };
  }
}
