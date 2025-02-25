import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  FirebaseAuth _auth=FirebaseAuth.instance;
  
  Future<User?> login(String email, password)async{
    try {
      UserCredential _userCredential= await _auth.signInWithEmailAndPassword(email: email, password: password);
      return _userCredential.user; 
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  Future<User?> register(String email, password)async{
    try {
      UserCredential _userCredential= await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return _userCredential.user; 
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }  

  Future<void> logout()async{
    await _auth.signOut();
  }

  Future<User?> getCurrentUser()async{
    return _auth.currentUser;
  }
}