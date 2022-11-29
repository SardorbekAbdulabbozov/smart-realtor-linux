import 'package:dio/dio.dart';
import 'package:my_home/data/provider/response_handler.dart';
import 'package:my_home/data/provider/server_error.dart';
import 'package:my_home/data/repository/base/base_repository.dart';
import 'package:my_home/models/user/user_details_response.dart';

class ProfileRepository extends BaseRepository {
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
}
