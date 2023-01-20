import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getPeople() async {
  List people = [];

  CollectionReference collectionReferencePeople = db.collection("people");

  QuerySnapshot queryPeople = await collectionReferencePeople.get();

  for (final documento in queryPeople.docs) {
    people.add(documento.data());
  }

  return people;
}

Future<void> insertName({required String name}) async {
  await db.collection("people").add({
    "name": name,
  });
}

Future<void> updateName({required String uid, required String newName}) async {
  await db.collection("people").doc(uid).set({
    "name": newName,
  });
}
