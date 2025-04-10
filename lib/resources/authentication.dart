// ignore_for_file: unused_local_variable

import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Authentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _fire = FirebaseFirestore.instance;

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
          bio.isNotEmpty
      //file != null
      ) {
        //register user
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
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
        await _fire.collection('users').doc(cred.user!.uid).set({
          'username': username,
          'uid': cred.user!.uid,
          'bio': bio,
          'email': email,
          'followers': [],
          'following': [],
        });
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
