import 'package:firebase_auth/firebase_auth.dart';
import 'package:coffee_selector/models/user.dart';
import 'package:coffee_selector/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Objet User base sur FirebaseUser
  User _userFromFireBaseUser(FirebaseUser firebaseUser) {
    return firebaseUser != null ? User(uid: firebaseUser.uid) : null;
  }

  //auth reactive screen stream
  Stream<User> get user {
    return _auth.onAuthStateChanged
        //.map((FirebaseUser user) => _userFromFireBaseUser(user) );
        .map(_userFromFireBaseUser);
  }

  // Connexion Anonyme
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFireBaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

// Connexion par Email
Future SignInWithEmail(String email,String password) async{
  try {
    AuthResult result = await _auth
        .signInWithEmailAndPassword(email: email, password: password);
    FirebaseUser user = result.user;
    return _userFromFireBaseUser(user);
  } catch (e) {
    print(e);
    return null;
  }
}
// Inscription par email
  Future RegisterWithEmail(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      //create a document with the uid of the new user
      await DatabaseService(uid: user.uid).updateUserData('0', 'new user', 100);
      return _userFromFireBaseUser(user);
    } catch (e) {
      print(e);
      return null;
    }
  }

// deconnexion
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
