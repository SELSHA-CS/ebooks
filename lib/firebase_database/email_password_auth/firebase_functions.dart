import 'package:firebase_auth/firebase_auth.dart';

class FireBaseFunction{
  final FirebaseAuth auth = FirebaseAuth.instance;

  ///register user
  Future<String?> registerUser({required String email, required String pwd}) async{
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: pwd,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      // if (e.code ==   'weak-password') {
      //   print('The password provided is too weak.');
      // } else if (e.code == 'email-already-in-use') {
      //   print('The account already exists for that email.');
      // }
      return e.message;
    } catch (e) {
      print(e);
    }
  }

  Future<String?> loginUser({required String emaill, required String pwd}) async{
    try {
      await auth.signInWithEmailAndPassword(
        email: emaill,
        password: pwd
      );
    } on FirebaseAuthException catch (e) {
      // if (e.code == 'user-not-found') {
      //   print('No user found for that email.');
      // } else if (e.code == 'wrong-password') {
      //   print('Wrong password provided for that user.');
      // }
      print(e.message);
      return e.message;
    }
  }

  Future<void> logoutUser() async{
    await FirebaseAuth.instance.signOut();
  }
}