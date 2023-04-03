// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:taskX/core/error/exceptions.dart';
import 'package:taskX/core/firebase/firestore_collections.dart';
import 'package:taskX/core/firebase/firestore_manager.dart';
import 'package:taskX/features/category/data/models/category_model.dart';
import 'package:uuid/uuid.dart';

import '../../../../../core/domain/entities/category/category_entity.dart';
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
    int? totalCategory;
    try {
      final User user = firebaseAuth.currentUser!;
      final person = await firestoreManager.getUser(user.uid);

      final userRef = firebaseFirestore
          .collection(FirestoreCollections.users)
          .doc(person.uid);
      await userRef.get().then((value) {
        totalCategory = value.data()!['totalCategory'];
      });
      if (totalCategory! >= 5) {
        throw LimitCategoryException();
      } else {
        String id = const Uuid().v4();

        final CategoryModel categoryModel = CategoryModel(
          description: category.description,
          color: category.color,
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
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> IsInCategoriesLimit() async {
    int? totalCategory;

    try {
      final User user = firebaseAuth.currentUser!;
      final person = await firestoreManager.getUser(user.uid);

      final userRef = firebaseFirestore
          .collection(FirestoreCollections.users)
          .doc(person.uid);

      // Get totalCategory of current user
      await userRef.get().then(
        (value) {
          totalCategory = value.data()!['totalCategory'];
        },
      );

      /* 
      Check if it is not extrapolating the limit of categories that the user 
      can have 
      */
      if (totalCategory! >= 5) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }
}
