import 'package:starter_codes/core/data/local/local_cache.dart';
import 'package:starter_codes/core/data/remote/auth/auth_interface.dart';
import 'package:starter_codes/core/utils/locator.dart';
import 'package:starter_codes/models/api_response.dart';
import 'package:starter_codes/models/auth_response_model.dart';

class AuthServiceImpl implements AuthService {
  final AuthRepository _authRepository;
  final LocalCache _localCache;

  AuthServiceImpl({
    AuthRepository? authRepository,
    LocalCache? localCache,
  })  : _authRepository = authRepository ?? locator(),
        _localCache = localCache ?? locator();

  @override
  Future<void> otpVerification({
    required String email,
    required String code,
  }) async {
    await _authRepository.otpVerification(
      email: email,
      code: code,
    );
  }

  @override
  Future<void> signUp({
    required String email,
    required String name,
    required String password,
    required String confirmPassword,
  }) async {
    await _authRepository.signUp(
      name: name,
      email: email,
      password: password,
      confirmPassword: confirmPassword,
    );
  }

  @override
  Future<ApiResponse<AuthResponse>> login(
      {required String name, required String password}) async {
    final response = await _authRepository.login(
      name: name,
      password: password,
    );
    await _localCache.saveToken(response.data!.token);
    return response;
  }

  @override
  Future<void> forgotPassword({required String email}) async {
    await _authRepository.forgotPassword(
      email: email,
    );
  }

  @override
  Future<void> resetPassword(
      {required String email, required String password}) async {
    await _authRepository.resetPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> resendCode({required String email}) async {
    await _authRepository.resendCode(
      email: email,
    );
  }
}
