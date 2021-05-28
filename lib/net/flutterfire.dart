import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<String> signIn(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    var firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser.emailVerified) {
      return "Verified";
    } else {
      return ("Verify your email first!");
    }
  } catch (e) {
    return e.message.toString();
  }
}

Future<bool> resetPassword(String email) async {
  try {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    return true;
  } catch (e) {
    print(e.toString());
    return false;
  }
}

Future<String> register(
    String name, DateTime dateOfBirth, String email, String password) async {
  try {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    var firebaseUser = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance.collection("Users").doc(firebaseUser.uid).set(
        {"name": name, "date_of_birth": dateOfBirth, "email": email}).then((_) {
      print("Success!");
    });
    try {
      await firebaseUser.sendEmailVerification();
      return ("Verification link sent, check your email inbox.");
    } catch (e) {
      return ("An error occurred while trying to send email verification");
    }
  } on FirebaseAuthException catch (e) {
    return e.message;
  }
}

Future<bool> fetchUserData() async {
  try {
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .get()
        .then((value) => print(value.data()));
    return true;
  } catch (e) {
    print(e.toString());
    return false;
  }
}

Future<bool> createList(
    String title, String description, List<String> list) async {
  try {
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection("Lists")
        .doc()
        .set({
      "title": title,
      "description": description,
      "list": list,
      "created_at": DateTime.now(),
    }).then((_) {
      print("Success!");
    });
    return true;
  } catch (e) {
    print(e.toString());
    return false;
  }
}
