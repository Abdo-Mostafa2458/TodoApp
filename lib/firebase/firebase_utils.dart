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
}
