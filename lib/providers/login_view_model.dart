import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:stacked/stacked.dart';
import 'package:todolist/configs/shared_preference.dart';

class LoginViewModel extends BaseViewModel {
  final FirebaseApp defaultApp = Firebase.app();
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  String _getUser;
  String get getUser => _getUser;

  // Event when Login with Google clicked
  Future<void> signInWithGoogle() async {
    notifyListeners();
    final GoogleSignInAccount googleUser = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    User firebaseUser =
        (await FirebaseAuth.instance.signInWithCredential(credential)).user;

    // print("== Isi User: " + firebaseUser.email);

    if (firebaseUser != null) {
      final QuerySnapshot result =
          await users.where('email', isEqualTo: firebaseUser.email).get();
      final List<DocumentSnapshot> documents = result.docs;

      if (documents.length == 0) {
        // print("== Belum Ada Di DB");
        saveUserDB(firebaseUser.displayName,
            firebaseUser.email, firebaseUser.photoURL);
      }
      await SharedPreference.setEmail(firebaseUser.email);
      _getUser = firebaseUser.displayName;
    }
  }

  // When success login, call this function if no email's record in Firestore
  Future<void> saveUserDB(String fullName, String email, String avatarURL) {
    return users
        .add({
          'name': fullName,
          'email': email,
          'avatarURL': avatarURL,
        })
        .then((value) => print("== saveUserDB Success: User Added"))
        .catchError((error) => print("== saveUserDB Failed: $error"));
  }
}
