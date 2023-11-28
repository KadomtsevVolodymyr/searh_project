import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:search_project/data/datasource/network/exchange_models/action_errors.dart';
import 'package:search_project/data/datasource/network/api/authentication/authentication_api_interface.dart';
import 'package:search_project/data/datasource/network/exchange_models/response.dart';
import 'package:search_project/domain/entities/user.dart';

class AuthenticationApi implements IAuthenticationApi {
  AuthenticationApi({required auth.FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth;
  final auth.FirebaseAuth _firebaseAuth;

  @override
  Future<NetworkResponse<User>> login(String email, String password) async {
    auth.UserCredential? credential;
    try {
      credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on auth.FirebaseAuthException catch (e) {
      return ErrorResponse(UnauthorizedError(error: e));
    }
    final user = User(
      id: credential.credential?.providerId ?? '',
      email: email,
      loginDate: DateTime.now(),
    );
    return SuccessResponse<User>(user);
  }

  @override
  Future<NetworkResponse<User>> register(String email, String password) async {
    auth.UserCredential? credential;

    try {
      credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on auth.FirebaseAuthException catch (e) {
      return ErrorResponse(UnauthorizedError(error: e));
    }

    final user = User(
      id: credential.credential?.providerId ?? '',
      email: email,
      loginDate: DateTime.now(),
    );
    return SuccessResponse<User>(user);
  }

  @override
  Future<NetworkResponse<User>> googleLogin() async {
    GoogleSignInAccount? googleAccount;
    try {
      googleAccount = await GoogleSignIn().signIn();
    } catch (e) {
      return ErrorResponse(UnauthorizedError(error: e));
    }
    final user = User(
      id: googleAccount?.id ?? '',
      email: googleAccount?.email,
      loginDate: DateTime.now(),
    );
    return SuccessResponse<User>(user);
  }
}
