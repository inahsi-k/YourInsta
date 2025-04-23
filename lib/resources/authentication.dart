// ignore_for_file: unused_local_variable

import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as userf;
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:yourinsta/models/user.dart';

class Authentication {
  final userf.FirebaseAuth _auth = userf.FirebaseAuth.instance;
  final FirebaseFirestore _fire = FirebaseFirestore.instance;

  Future<UserModel> getUserDetails() async {
    userf.User currentUser = _auth.currentUser!;
    DocumentSnapshot snap =
        await _fire.collection('users').doc(currentUser.uid).get();
    return UserModel.fromSnap(snap);
  }

  //sign_up  user
  Future<String> signUpUser({
    required String email,
    required String password,
    required String bio,
    required String username,
    required Uint8List file,
  }) async {
    String res = "Some error occurred";
    try {
      if (email.isNotEmpty &&
          password.isNotEmpty &&
          username.isNotEmpty &&
          bio.isNotEmpty) {
        //register user
        userf.UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        //storage methods via supabase
        final String filepath = 'user_uploads/${cred.user!.uid}';
        final supb = Supabase.instance.client;
        final storageResponse = await supb.storage
            .from('user_uploads')
            .uploadBinary(filepath, file);
        // if(storageResponse.error != null){
        //   final error = storageResponse.error;
        //   return error.toString();
        // }
        final String imageUrl = supb.storage
            .from('user_uploads')
            .getPublicUrl(filepath);

        //add user to database
        UserModel user = UserModel(
          username: username,
          uid: cred.user!.uid,
          photoUrl: imageUrl,
          email: email,
          bio: bio,
          followers: [],
          following: [],
        );
        await _fire.collection('users').doc(cred.user!.uid).set(user.toJson());
        res = "success";
      } else {
        res = "Please fill all the fields";
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  //login
  Future<String> login({
    required String email,
    required String password,
  }) async {
    String res = "Some error occurred";
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        //login user
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        res = "success";
      } else {
        res = "Please fill all the fields";
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
