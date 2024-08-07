import 'package:starter_codes/models/api_response.dart';
import 'package:starter_codes/models/auth_response_model.dart';

abstract class AuthInterface {
  Future<void> otpVerification({
    required String email,
    required String code,
  });

  Future<void> signUp({
    required String email,
    required String name,
    required String password,
    required String confirmPassword,
  });

  Future<void> forgotPassword({
    required String email,
  });

  Future<void> resetPassword({
    required String email,
    required String password,
  });

  Future<void> resendCode({
    required String email,
  });

  Future<ApiResponse<AuthResponse>> login(
      {required String name, required String password});
}

abstract class AuthRepository implements AuthInterface {}

abstract class AuthService implements AuthInterface {}
