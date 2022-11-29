import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_home/controllers/profile_controller.dart';
import 'package:my_home/core/constants/app_constants.dart';
import 'package:my_home/core/custom_widgets/custom_button.dart';
import 'package:my_home/core/custom_widgets/profile_item.dart';

class ProfileUsersPage extends StatelessWidget {
  const ProfileUsersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      builder: (logic) {
        final width = MediaQuery.of(context).size.width;
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.2),
            child: Column(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  margin: EdgeInsets.only(bottom: 16, top: width * 0.05),
                  padding: AppConstants.marginAll6,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                  child: SvgPicture.asset(
                    'assets/svg/ic_profile_${logic.localSource.getGender() ? 'male' : 'female'}.svg',
                    height: 20,
                    width: 20,
                  ),
                ),
                Container(
                  color: Colors.grey,
                  width: double.infinity,
                  height: 1,
                ),
                ProfileItem(
                  title: 'Username',
                  content:
                      '@${logic.localSource.getProfile().username ?? 'noname'}',
                  icon: Icons.person,
                ),
                ProfileItem(
                  title: 'Email',
                  content: logic.localSource.getProfile().email ?? '-',
                  icon: Icons.email,
                ),
                AppConstants.boxHeight24,
                /*(logic.localSource.getProfile().isEmailVerified ?? false)
                    ? AppConstants.boxHeight24
                    : AppConstants.boxHeight8,*/
                Visibility(
                  visible: false
                  /*!(logic.localSource.getProfile().isEmailVerified ?? false)*/,
                  child: Padding(
                    padding: AppConstants.marginVertical16,
                    child: CustomButton(
                      color: Colors.green,
                      isLoading: logic.isLoading,
                      title: 'Verify Email',
                      onPressed: logic.getProfile,
                    ),
                  ),
                ),
                CustomButton(
                  title: 'Logout',
                  onPressed: logic.logout,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
