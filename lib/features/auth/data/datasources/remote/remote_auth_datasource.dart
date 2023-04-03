// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';

import 'package:taskX/core/firebase/firestore_manager.dart';
import 'package:taskX/features/auth/data/datasources/remote/base_remote_auth_datasource.dart';
import '../../../../../core/domain/entities/user/entities/user_entity.dart';

class RemoteAuthDataSource implements BaseRemoteAuthDataSource {
  final FirebaseAuth firebaseAuth;
  final FirestoreManager firestoreManager;

  RemoteAuthDataSource({
    required this.firebaseAuth,
    required this.firestoreManager,
  });

  @override
  Future<UserEntity?> getCurrentUser() async {
    try {
      final currentUser = firebaseAuth.currentUser;
      if (currentUser != null) {
        final user = await firestoreManager.getUser(currentUser.uid);
        return user;
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> isSignIn() async => firebaseAuth.currentUser != null;

  @override
  Future<void> signOut() async {
    try {
      await firebaseAuth.signOut();
    } catch (e) {
      rethrow;
    }
  }
}
