// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:taskX/core/firebase/firestore_manager.dart';
import 'package:taskX/features/credential/data/datasources/remote/base_remote_credential_datasource.dart';

import 'package:taskX/features/credential/data/models/user_model.dart';
import 'package:taskX/features/credential/domain/entities/user_entity.dart';

class RemoteCredentialDataSource implements BaseRemoteCredentialDataSource {
  final FirebaseAuth firebaseAuth;
  final FirestoreManager firestoreManager;

  RemoteCredentialDataSource({
    required this.firebaseAuth,
    required this.firestoreManager,
  });

  @override
  Future<UserEntity> login() {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<UserEntity> loginWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      // Create a new credential
      final googleCredential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential =
          await firebaseAuth.signInWithCredential(googleCredential);

      return await _getGoogleUser(userCredential);
    } catch (e) {
      rethrow;
    }
  }

  Future<UserEntity> _getGoogleUser(UserCredential userCredential) async {
    late final UserModel userModel;
    final googleUser = userCredential.user!;

    // Google user to userModel
    userModel = UserModel(
      email: googleUser.email,
      name: googleUser.displayName,
      uid: googleUser.uid,
    );

    // Add Google user to firestore
    await firestoreManager.addUser(userModel);
    return userModel;
  }

  @override
  Future<bool> resetPassword() {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  @override
  Future<UserEntity> signUp() {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
