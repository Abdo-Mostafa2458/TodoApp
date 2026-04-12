import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/firebase/Task.dart';

class FirebaseUtils {
  static CollectionReference<Task> getCollections() {
    return FirebaseFirestore.instance
        .collection(Task.taskCollection)
        .withConverter<Task>(
          fromFirestore: (snapshot, options) =>
              Task.fromFireStore(snapshot.data()!),
          toFirestore: (Task, options) => Task.toFireStore(),
        );
  }

  static Future<void> addTaskToFireStore(Task task) {
    CollectionReference<Task> taskCollection = getCollections(); //collection
    DocumentReference<Task> taskDocRef = taskCollection.doc(); //document
    task.id = taskDocRef.id; //auto id
    return taskDocRef.set(task);
  }

  static Future<List<Task>> getTasksFromFireStore() async {
    // QuerySnapshot<Task> querySnapshot = await FirebaseUtils.getCollections().get();
    CollectionReference<Task> taskCollection = getCollections();
    QuerySnapshot<Task> querySnapshot = await taskCollection.get();
    //List<QueryDocumentSnapshot<T>> => List<Task>
    return querySnapshot.docs
        .map(
          (doc) => doc.data(),
        )
        .toList(); //List <Task>
  }
  // static Future<void> deleteTasksFromFireStore(String id) async {
  //   // QuerySnapshot<Task> querySnapshot = await FirebaseUtils.getCollections().get();
  //   //List<QueryDocumentSnapshot<T>> => List<Task>
  //   CollectionReference<Task> taskCollection= getCollections();//Collection
  //    taskCollection.doc(id).delete();
  //
  //
  // }
  static Future<void> UpdateTasksFromFireStore(Task task,
      {bool isDone = false,
      String title = '',
      String description = '',
      DateTime? dateTime}) async {
    CollectionReference<Task> taskCollection = getCollections();
    return taskCollection.doc(task.id).update({
      'isDone': isDone,
      'title': title,
      'description': description,
      'dateTime': dateTime?.millisecondsSinceEpoch ??
          task.dateTime.millisecondsSinceEpoch,
    });
  }

  static Future<void> deleteTasksFromFireStore(Task task) async {
    // QuerySnapshot<Task> querySnapshot = await FirebaseUtils.getCollections().get();
    //List<QueryDocumentSnapshot<T>> => List<Task>
    CollectionReference<Task> taskCollection = getCollections(); //Collection
    taskCollection.doc(task.id).delete();
  }
}
