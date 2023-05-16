// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:taskX/core/firebase/firestore_collections.dart';

import 'package:uuid/uuid.dart';

import '../models/category/category_model.dart';
import '../models/user/user_model.dart';

class FirestoreManager {
  final FirebaseFirestore firestore;
  // final FirebaseStorage firebaseStorage;
  // final FirebaseAuth firebaseAuth;

  FirestoreManager({
    // required this.firebaseStorage,
    // required this.firebaseAuth,
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

  Future<void> saveCateoriesLocalToRemote(
    String userId,
    List<CategoryModel> categories,
  ) async {
    final person = await getUser(userId);

    final userRef =
        firestore.collection(FirestoreCollections.users).doc(person.uid);

    for (var category in categories) {
      String id = const Uuid().v4();
      CategoryModel categoryModel = CategoryModel(
        description: category.description,
        color: category.color,
        createdAt: category.createdAt,
        icon: category.icon,
        name: category.name,
        updateAt: category.updateAt,
        uid: id,
      );

      userRef
          .collection(FirestoreCollections.categories)
          .doc(categoryModel.uid)
          .set(categoryModel.toJson());

      await userRef.update({"totalCategory": person.totalCategory! + 1});
    }

    // categories.map((category) async {
    //   CategoryModel categoryModel = CategoryModel(
    //     description: category.description,
    //     color: category.color,
    //     createdAt: category.createdAt,
    //     icon: category.icon,
    //     name: category.name,
    //     updateAt: category.updateAt,
    //     uid: id,
    //   );
    //   final doc = userRef
    //       .collection(FirestoreCollections.categories)
    //       .doc(categoryModel.uid)
    //       .set(categoryModel.toJson());
    //   await userRef.update({"totalCategory": person.totalCategory! + 1});
    // });
    // List collection = [1, 1];
  }

  Future<int> getCountCategories(String uid) async {
    final categoryCollection = firestore
        .collection(FirestoreCollections.users)
        .doc(uid)
        .collection(FirestoreCollections.categories)
        .where("isDeleted", isEqualTo: false);

    var query = await categoryCollection.get();
    return query.size;
  }

  // Future<String> uploadImageToStorage({
  //   required FilePickerResult file,
  //   required String childName,
  //   required bool isTaskFile,
  // }) async {
  //   Reference storageRef = firebaseStorage
  //       .ref()
  //       .child(childName)
  //       .child(firebaseAuth.currentUser!.uid);
  //   if (isTaskFile) {
  //     String id = const Uuid().v1();
  //     storageRef = storageRef.child(id);
  //   }

  //   final uploadTask = storageRef.putFile(File(file.files.first.path!));
  //   final fileUrl =
  //       (await uploadTask.whenComplete(() => {})).ref.getDownloadURL();

  //   return fileUrl;
  // }
}
