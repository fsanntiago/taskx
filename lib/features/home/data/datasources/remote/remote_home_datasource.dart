import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:taskX/core/domain/entities/category/category_entity.dart';
import 'package:taskX/core/firebase/firestore_manager.dart';
import 'package:taskX/core/models/category/category_model.dart';
import 'package:taskX/core/utils/app_boxes.dart';

import '../../../../../core/firebase/firestore_collections.dart';
import 'base_remote_home_datasource.dart';

class RemoteHomeDataSource implements BaseRemoteHomeDataSource {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;
  final FirestoreManager firestoreManager;

  RemoteHomeDataSource({
    required this.firebaseAuth,
    required this.firebaseFirestore,
    required this.firestoreManager,
  });

//     final List<CategoryModel> categories;
//     final uid = firebaseAuth.currentUser?.uid;
//     List<CategoryEntity> localCategories = AppBoxes.categoryBox.values.map((e) => e).toList();

// if(localCategories.isNotEmpty){
//   await firestoreManager.saveCateoriesLocalToRemote(uid!);
// }

//     // Get all categories from firestore
//     final ownCategories = await _getCategories(uid!);
//     if (ownCategories.isNotEmpty) {
//       await AppBoxes.categoryBox.addAll(ownCategories);
//     }

  @override
  Future<List<CategoryEntity>> homeLoadCategories() async {
    await AppBoxes.categoryBox.clear();
    final uid = firebaseAuth.currentUser?.uid;

    List<CategoryEntity> allCategories = [];
    final List<CategoryEntity> yourCategories =
        await _getPersonCategories(uid!);
    allCategories.addAll(yourCategories);

    if (allCategories.isNotEmpty) {
      await AppBoxes.categoryBox.addAll(allCategories);
    }

    return allCategories;
  }

  Future<List<CategoryEntity>> _getPersonCategories(String uid) async {
    final allCategories = await firebaseFirestore
        .collection(FirestoreCollections.users)
        .doc(uid)
        .collection(FirestoreCollections.categories)
        .orderBy("createdAt", descending: true)
        .get();

    List<CategoryEntity> categories = allCategories.docs
        .map((category) => CategoryModel.fromSnapshot(category))
        .toList();

    return categories;
  }
}
