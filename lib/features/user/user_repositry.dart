import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sparkdigital/features/user/models/app_user.dart';

class UserRepository {
  static final UserRepository _instance = UserRepository._internal();
  late FirebaseFirestore _firestore;
  late CollectionReference _userCollection;

  factory UserRepository() {
    return _instance;
  }

  UserRepository._internal() {
    _firestore = FirebaseFirestore.instance;
    _userCollection = _firestore.collection('user');
  }

  Future<AppUser> getUser(String id) async {
    try {
      final userDoc = await _userCollection.doc(id).get();
      if (userDoc.exists) {
        AppUser user = AppUser.fromMap(userDoc.data() as Map<String, dynamic>);
        return Future.value(user);
      }
      throw UserNotAavailableException();
    } catch (_) {
      throw UserException();
    }
  }

  Future<void> createUser(AppUser user) async {
    if (user.id == null) throw UserIdNullException();
    try {
      await _userCollection.doc(user.id).set(user.toMap());
    } catch (e) {
      throw UserException();
    }
  }
}

class UserIdNullException implements Exception {}

class UserNotAavailableException implements Exception {}

class UserException implements Exception {}
