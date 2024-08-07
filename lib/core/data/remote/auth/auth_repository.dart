import 'package:starter_codes/core/constants/api_routes.dart';
import 'package:starter_codes/core/data/remote/auth/auth_interface.dart';
import 'package:starter_codes/core/utils/app_logger.dart';
import 'package:starter_codes/core/utils/network_client.dart';
import 'package:starter_codes/models/api_response.dart';
import 'package:starter_codes/models/auth_response_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  late final NetworkClient _client = NetworkClient();
  final AppLogger _logger = const AppLogger(AuthRepositoryImpl);

  @override
  Future<void> otpVerification({
    required String email,
    required String code,
  }) async {
    await _client.post(ApiRoute.otpVerification, body: {
      'email': email,
      'code': code,
    });
  }

  @override
  Future<void> signUp({
    required String email,
    required String name,
    required String password,
    required String confirmPassword,
  }) async {
    await _client.post(ApiRoute.signUp, body: {
      "email": email,
      "name": name,
      "password": password,
      "confirmPassword": confirmPassword,
    });
  }

  @override
  Future<ApiResponse<AuthResponse>> login(
      {required String name, required String password}) async {
    final response = await _client.post(ApiRoute.login, body: {
      'name': name,
      'password': password,
    });
    _logger.d(response);
    return ApiResponse.fromJson(
      response,
      parser: (json) {
        return AuthResponse.fromJson(json["data"]);
      },
    );
  }

  @override
  Future<void> forgotPassword({required String email}) async {
    await _client.post(ApiRoute.forgotPassword, body: {
      "email": email,
    });
  }

  @override
  Future<void> resetPassword(
      {required String email, required String password}) async {
    await _client.patch(ApiRoute.resetPassword, body: {
      "email": email,
      "password": password,
    });
  }

  @override
  Future<void> resendCode({required String email}) async {
    await _client.post(ApiRoute.resendCode, body: {
      "email": email,
    });
  }
}
