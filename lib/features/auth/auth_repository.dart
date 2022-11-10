import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  static final AuthRepository _instance = AuthRepository._internal();
  static late FirebaseAuth _auth;
  final _controller = StreamController<User?>();

  factory AuthRepository() {
    return _instance;
  }

  AuthRepository._internal() {
    _auth = FirebaseAuth.instance;
  }

  void dispose() => _controller.close();

  Stream<User?> get user async* {
    _auth.authStateChanges().listen((User? user) {
      if (user != null) {
        _controller.add(user);
      } else {
        _controller.add(null);
      }
    });
    yield* _controller.stream;
  }

  Future<void> signin({required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email':
        case 'wrong-password':
        case 'user-not-found':
          throw AuthInvalidUsernameOrPasswordException();
        case 'user-disabled':
          throw AuthPermissionDenierdException();
        default:
          throw AuthException();
      }
    } catch (_) {
      throw AuthException();
    }
  }

  Future<void> signup({required String email, required String password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        throw AuthEmailAlreadyExistsException();
      }
      throw AuthException();
    } catch (_) {
      throw AuthException();
    }
  }

  Future<void> signout() async {
    try {
      await _auth.signOut();
    } catch (_) {
      throw AuthSignoutException();
    }
  }
}

class AuthInvalidUsernameOrPasswordException implements Exception {}

class AuthPermissionDenierdException implements Exception {}

class AuthEmailAlreadyExistsException implements Exception {}

class AuthException implements Exception {}

class AuthSignoutException implements Exception {}
