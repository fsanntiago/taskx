// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:taskX/core/firebase/firestore_collections.dart';
import 'package:taskX/features/credential/data/models/user_model.dart';

class FirestoreManager {
  final FirebaseFirestore firestore;

  FirestoreManager({
    required this.firestore,
  });

  Future<void> addUser(UserModel user) async {
    await firestore
        .collection(FirestoreCollections.users)
        .doc(user.uid)
        .set(user.toJson());
  }

  Future<bool> checkIfPersonExist(String uid) async {
    final person =
        await firestore.collection(FirestoreCollections.users).doc(uid).get();
    return person.exists;
  }

  Future<UserModel> getUser(String uid) async {
    final userCollection =
        await firestore.collection(FirestoreCollections.users).doc(uid).get();

    return UserModel.fromSnapshot(userCollection);
  }
}
