import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> userSetup(String username, String email) async {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser!.uid.toString();
  String email = auth.currentUser!.email.toString();
  users.add({'username': username, 'uid': uid, 'email': email});
  auth.currentUser!.updateDisplayName(username);

  return;
}
