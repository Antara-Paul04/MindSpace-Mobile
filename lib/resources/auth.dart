import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> signupUser(
      {required String email,
      required String password,
      required String userName}) async {
    String res = 'Some error occurred';
    try {
      if (email.isNotEmpty || password.isNotEmpty || userName.isNotEmpty) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        // print(cred.user!.uid);

        await _firestore
            .collection('user')
            .doc(cred.user!.uid)
            .set({'email': email, 'password': password, 'username': userName});

        res = 'success';
      }
    } on FirebaseAuthException catch (err) {
      if (err.code == 'invalid-email') {
        res = 'The email is badly formatted.';
      } else if (err.code == 'weak-password') {
        res = 'The password should be atleast 6 characters';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future<dynamic> loginUser({
    required String email,
    required String password,
  }) async {
    List<dynamic> res = ['Some error occured',''];
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        UserCredential cred = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        var userId = cred.user!.uid;
        // print(userId);
        var docRef = _firestore.collection('user').doc(userId);
        var docSnapshot = await docRef.get();
        if (docSnapshot.exists) {
          final data = docSnapshot.data() as Map<String, dynamic>;
          res[1] = data['username'];
          res[0] = 'success';
        } else {
          res[0] = 'User document not found';
        }
      } else {
        res[0] = 'Please fill in all fields';
      }
    } on FirebaseAuthException catch (err) {
      // print('Error code: ${err.code}');
      if (err.code == 'user-not-found') {
        res[0] = 'User not found for this email';
      } else if (err.code == 'wrong-password') {
        res[0] = 'Entered password is wrong';
      }
    } catch (e) {
      res[0] = e.toString();
    }
    return res;
  }
}
