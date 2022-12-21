import 'package:dio/dio.dart';
import 'package:my_home/data/provider/response_handler.dart';
import 'package:my_home/data/provider/server_error.dart';
import 'package:my_home/data/repository/base/base_repository.dart';
import 'package:my_home/models/auth/sign_up_request.dart';
import 'package:my_home/models/auth/sign_up_response.dart';
import 'package:my_home/models/user/user_details_response.dart';
import 'package:my_home/models/verification/verify_email_request.dart';

class LoginRepository extends BaseRepository {
  Future<ResponseHandler<UserDetailsResponse>> _fetchLogin(
    String username,
    String password,
  ) async {
    UserDetailsResponse response;
    try {
      response = await apiClient.login(1, username, password);
    } catch (error, _) {
      return ResponseHandler()
        ..setException(ServerError.withError(error: error as DioError));
    }
    return ResponseHandler()..data = response;
  }

  Future<dynamic> login({
    required String username,
    required String password,
  }) async {
    final response = await _fetchLogin(username, password);
    if (response.data != null) {
      return response.data;
    } else if (checkIsCancelled(response.getException())) {
      return getErrorMessage(response.getException()!.getErrorMessage());
    }
  }

  Future<ResponseHandler<SignUpResponse>> _fetchSignUp(
    SignUpRequest request,
  ) async {
    SignUpResponse response;
    try {
      response = await apiClient.signUp(1, request);
    } catch (error, _) {
      return ResponseHandler()
        ..setException(ServerError.withError(error: error as DioError));
    }
    return ResponseHandler()..data = response;
  }

  Future<dynamic> singUp({
    required String username,
    required String password,
    required String email,
    required String phone,
    required bool gender,
    required bool isOwner,
  }) async {
    final request = SignUpRequest(
      username: username,
      email: email,
      gender: gender,
      password: password,
      isOwner: isOwner,
      phone: phone,
      isAdmin: email.contains("@smart.realtor.com"),
    );
    final response = await _fetchSignUp(request);
    if (response.data != null) {
      return response.data;
    } else if (checkIsCancelled(response.getException())) {
      return getErrorMessage(response.getException()!.getErrorMessage());
    }
  }

  Future<ResponseHandler<UserDetailsResponse>> _fetchProfile(
      String sessionToken,
      ) async {
    UserDetailsResponse response;
    try {
      response = await apiClient.getUserDetails(sessionToken);
    } catch (error, _) {
      return ResponseHandler()
        ..setException(ServerError.withError(error: error as DioError));
    }
    return ResponseHandler()..data = response;
  }

  Future<dynamic> getProfile({required String sessionToken}) async {
    final response = await _fetchProfile(sessionToken);
    if (response.data != null) {
      return response.data;
    } else if (checkIsCancelled(response.getException())) {
      return getErrorMessage(response.getException()!.getErrorMessage());
    }
  }

  Future<dynamic> verifyEmail({required String email}) async {
    if (email.isEmpty) return;
    await apiClient.verifyEmail(VerifyEmailRequest(email: email));
  }

  Future<dynamic> sendResetPasswordLink({required String email}) async {
    if (email.isEmpty) return;
    await apiClient.requestPasswordReset(VerifyEmailRequest(email: email));
  }
}
