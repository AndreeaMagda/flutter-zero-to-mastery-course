// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ztmcourse/models/user.dart';

final userProvider = StateNotifierProvider<UserNotifier, LocalUser>((ref) {
  return UserNotifier();
});

class LocalUser {
  const LocalUser({required this.id, required this.user});

  final String id;
  final FirebaseUser user;

  LocalUser copyWith({
    String? id,
    FirebaseUser? user,
  }) {
    return LocalUser(
      id: id ?? this.id,
      user: user ?? this.user,
    );
  }
}

class UserNotifier extends StateNotifier<LocalUser> {
  UserNotifier()
      : super(const LocalUser(id: "error", user: FirebaseUser(email: "error", name:"error", profilePic: "error")));

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> login(String email) async {
    QuerySnapshot response = await _firestore
        .collection("users")
        .where("email", isEqualTo: email)
        .get();
        if(response.docs.isEmpty){
          print("No firebase user associated to authenticated email $email");
          return;
        }
          if(response.docs.length!=1){
          print("More than one firebase user associate with email $email");
          return;
        }

    state = LocalUser(
      id: response.docs[0].id,
      user:  FirebaseUser.fromMap(response.docs[0].data() as Map<String,dynamic>)
    );
  }

  Future<void> signUp(String email) async {
    DocumentReference response = await _firestore.collection("users").add(
          FirebaseUser(email: email, name: "No name",profilePic: 'http://www.gravatar.com/avatar/?d=mp').toMap(),
        );
        DocumentSnapshot snapshot=await response.get();
    state = LocalUser(
      id: response.id,
      user: FirebaseUser.fromMap(snapshot.data() as Map<String,dynamic>),
    );
  }

  void logout() {
    state = const LocalUser(id: "error", user: FirebaseUser(email: "error", name:"error", profilePic: "error"));
  }
}
