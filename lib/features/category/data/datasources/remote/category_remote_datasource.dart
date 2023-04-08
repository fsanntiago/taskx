// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:taskX/core/firebase/firestore_collections.dart';
import 'package:taskX/core/firebase/firestore_manager.dart';
import 'package:uuid/uuid.dart';

import '../../../../../core/domain/entities/category/category_entity.dart';
import '../../../../../core/models/category/category_model.dart';
import '../../../../../core/models/user/user_model.dart';
import 'base_remote_category_datasource.dart';

class CategoryRemoteDataSource implements BaseRemoteCategoryDataSource {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;
  final FirestoreManager firestoreManager;

  CategoryRemoteDataSource({
    required this.firebaseAuth,
    required this.firebaseFirestore,
    required this.firestoreManager,
  });

  @override
  Future<CategoryEntity> createCategory(CategoryEntity category) async {
    try {
      final User user = firebaseAuth.currentUser!;
      final UserModel person = await firestoreManager.getUser(user.uid);

      final userRef = firebaseFirestore
          .collection(FirestoreCollections.users)
          .doc(person.uid);

      String id = const Uuid().v4();

      final CategoryModel categoryModel = CategoryModel(
        description: category.description,
        color: category.color,
        isDeleted: false,
        createdAt: category.createdAt,
        icon: category.icon,
        name: category.name,
        updateAt: category.updateAt,
        uid: id,
      );

      final doc = userRef
          .collection(FirestoreCollections.categories)
          .doc(categoryModel.uid)
          .set(categoryModel.toJson());
      await userRef.update({"totalCategory": person.totalCategory! + 1});

      return categoryModel.copyWith();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> isInCategoriesLimit() async {
    try {
      final User user = firebaseAuth.currentUser!;

      final countCategories =
          await firestoreManager.getCountCategories(user.uid);
      if (countCategories >= 5) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }
}
