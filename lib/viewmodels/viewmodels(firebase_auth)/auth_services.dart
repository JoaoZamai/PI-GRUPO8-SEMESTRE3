import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

ValueNotifier<AuthServices> authService = ValueNotifier(AuthServices());

class AuthServices {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => firebaseAuth
      .currentUser; //isso da acesso ao usuário atual a qualquer momento

  Stream<User?> get authStateChanges => firebaseAuth
      .authStateChanges(); //retorna informaçao pra saber se o usuario ta conectado ou nao

  Future<UserCredential> signIn({
    required String email,
    required String password,
  }) async {
    return await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  } // logar

  Future<UserCredential> createAccount({
    required String email,
    required String password,
  }) async {
    return await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  } // criar usuário

  Future<void> signOut() async {
    await firebaseAuth.signOut();
  } // logout

  Future<void> resetPassword({required String email}) async {
    await firebaseAuth.sendPasswordResetEmail(email: email);
  } // mudar a senha (colocando o email vinculado a conta dele)

  Future<void> updateUsername({required String newUsername}) async {
    User? user = firebaseAuth.currentUser;
    if (user != null) {
      await user.updateDisplayName(newUsername);
    }
  } //muda o nome do usuário

  Future<void> deleteAccount({
    required String email,
    required String password,
  }) async {
    AuthCredential credential = EmailAuthProvider.credential(
      email: email,
      password: password,
    );
    await currentUser!.reauthenticateWithCredential(credential);
    await currentUser!.delete();
    await firebaseAuth.signOut();
  } //deleta a conta do usuário

  Future<void> resetPasswordFromCurrentPassword({
    required String currentPassword,
    required String newPassword,
    required String email,
  }) async {
    AuthCredential credential = EmailAuthProvider.credential(
      email: email,
      password: currentPassword,
    );
    await currentUser!.reauthenticateWithCredential(credential);
    await currentUser!.updatePassword(newPassword);
  } // mudar a senha (exige a senha antiga e a nova, junto do email)
}
