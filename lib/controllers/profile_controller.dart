import 'package:get/get.dart';
import 'package:my_home/controllers/base/base_controller.dart';
import 'package:my_home/core/app_routes/app_route_names.dart';
import 'package:my_home/data/repository/profile_repository.dart';
import 'package:my_home/models/ui_models/user.dart';
import 'package:my_home/models/user/user_details_response.dart';

class ProfileController extends BaseController {
  final ProfileRepository _repository = ProfileRepository();

  Future<void> logout() async {
    await localSource.removeProfile();
    await hive.clearFavourites();
    await localSource.setIntroShowStatus(value: false);
    Get.offNamed(AppRouteNames.LOGIN);
  }

  void getProfile() async {
    setLoading(true);
    var result = await _repository.getProfile(
        sessionToken: localSource.getProfile().sessionToken ?? '');
    if (result is UserDetailsResponse) {
      await localSource.setProfile(
        User(
          email: result.email,
          username: result.username,
          sessionToken: result.sessionToken,
          gender: result.gender,
          isEmailVerified: result.emailVerified,
          isAdmin: result.isAdmin,
          isOwner: result.isOwner,
          phone: result.phone,
        ),
      );
      update();
      setLoading(false);
      if(result.emailVerified??false){
        showSuccessSnackBar(message: 'Email is successfully verified!');
      }else{
        showErrorSnackBar('Email is not verified! :(');
      }
    } else {
      setLoading(false);
    }
  }
}
