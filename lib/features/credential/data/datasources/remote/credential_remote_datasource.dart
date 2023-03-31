// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:taskX/core/error/error_codes.dart';
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
  Future<UserEntity> signUp(UserEntity user) async {
    try {
      final UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: user.email!,
        password: user.password!,
      );
      final uid = userCredential.user!.uid;

      UserModel userModel = UserModel(
        createdAt: DateTime.now().toUtc(),
        email: user.email!.trim(),
        name: user.name!.trim(),
        uid: uid,
      );
      userCredential.user?.updateDisplayName(userModel.name);

      await firestoreManager.addUser(userModel);
      return userModel;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserEntity> signIn(UserEntity user) async {
    final UserCredential userCredential =
        await firebaseAuth.signInWithEmailAndPassword(
      email: user.email!,
      password: user.password!,
    );
    final uid = userCredential.user!.uid;

    final userModel = await firestoreManager.getUser(uid);
    return userModel;
  }

  @override
  Future<UserEntity?> loginWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser != null) {
        // Obtain the auth details from the request
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        if (googleAuth.idToken != null) {
          // Create a new credential
          final googleCredential = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken,
            idToken: googleAuth.idToken,
          );

          final userCredential =
              await firebaseAuth.signInWithCredential(googleCredential);

          return await _getGoogleUser(userCredential);
        } else {
          throw FirebaseAuthException(
            code: ErrorCodes.missingGoogleIdToken,
          );
        }
      } else {
        throw FirebaseAuthException(
          code: ErrorCodes.signInGoogleCanceled,
        );
      }
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
      createdAt: DateTime.now().toUtc(),
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
}
