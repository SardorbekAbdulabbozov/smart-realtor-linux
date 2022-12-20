// ignore_for_file: depend_on_referenced_packages

import 'package:dio/dio.dart';
import 'package:dio_retry_plus/dio_retry_plus.dart';
import 'package:my_home/core/constants/app_constants.dart';
import 'package:my_home/models/auth/sign_up_request.dart';
import 'package:my_home/models/auth/sign_up_response.dart';
import 'package:my_home/models/product/product_list_response.dart';
import 'package:my_home/models/success/create_success_response.dart';
import 'package:my_home/models/user/user_details_response.dart';
import 'package:my_home/models/verification/verify_email_request.dart';
import 'package:my_home/models/visitor/request_visit_request.dart';
import 'package:my_home/models/visitor/request_visit_response.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: AppConstants.baseUrl)
abstract class ApiClient {
  static ApiClient? _apiClient;

  static CancelToken cancelToken = CancelToken();

  static get getDio {
    Dio dio = Dio(BaseOptions(followRedirects: false));

    dio.interceptors.add(
      RetryInterceptor(
        dio: dio,
        refreshTokenFunction: () async {
          cancelToken.cancel();
        },
        toNoInternetPageNavigator: () async {},
        forbiddenFunction: () async {},
      ),
    );
    dio.interceptors.add(
        LogInterceptor(responseBody: true, requestBody: true, request: true));
    return dio;
  }

  static ApiClient getInstance({String baseUrl = AppConstants.baseUrl}) {
    if (_apiClient != null) {
      return _apiClient!;
    } else {
      _apiClient = ApiClient(getDio, cancelToken, baseUrl);
      return _apiClient!;
    }
  }

  static removeApiClient() {
    _apiClient = null;
  }

  factory ApiClient(Dio dio, CancelToken cancelToken, String baseUrl) {
    dio.options = BaseOptions(receiveTimeout: 30000, connectTimeout: 30000);
    dio.options.headers = {
      "X-Parse-Application-Id": 'Q8MVZxU1JydIgL2buCyKgOFILDtMml3jyJlErxUI',
      "X-Parse-REST-API-Key": "7rIWukks5vKiFRmD8hHxNqWGABJaaD8At4im1dUc",
    };
    return _ApiClient(dio, baseUrl: baseUrl);
  }

  @POST("users")
  Future<SignUpResponse> signUp(
    @Header('X-Parse-Revocable-Session') int session,
    @Body() SignUpRequest request,
  );

  @POST("verificationEmailRequest")
  Future<void> verifyEmail(
    @Body() VerifyEmailRequest request,
  );

  @POST("requestPasswordReset")
  Future<void> requestPasswordReset(
    @Body() VerifyEmailRequest request,
  );

  @GET('login')
  Future<UserDetailsResponse> login(
    @Header('X-Parse-Revocable-Session') int session,
    @Query('username') String username,
    @Query('password') String password,
  );

  @GET("users/me")
  Future<UserDetailsResponse> getUserDetails(
    @Header('X-Parse-Session-Token') String sessionToken,
  );

  @GET("classes/Product")
  Future<ProductListResponse> getProductList();

  @GET("classes/Product")
  Future<ProductListResponse> getSpecificProducts(@Query('where') String? where);

  @GET("classes/Visitors")
  Future<RequestVisitResponse> getVisitors(@Query('where') String? where);

  @PUT('classes/Product/{objectId}')
  Future<void> updateProduct(
    @Path('objectId') String objectId,
    @Body() Results body,
  );

  @DELETE('classes/Product/{objectId}')
  Future<void> deleteProduct(@Path('objectId') String objectId);

  @POST('classes/Product')
  Future<CreateSuccessResponse> createProduct(@Body() Results body);

  @POST('classes/Visitors')
  Future<CreateSuccessResponse> requestVisit(@Body() RequestVisitRequest body);
}
/*flutter pub run build_runner build --delete-conflicting-outputs*/
/*flutter pub run build_runner watch --delete-conflicting-outputs*/
