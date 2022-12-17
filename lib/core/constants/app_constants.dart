import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_home/core/theme/app_colors.dart';

class AppConstants {
  static const baseUrl = 'https://parseapi.back4app.com/';
  static const defaultImageUrl = 'https://cuttingedgeds.com/wp-content/uploads/2019/12/Luxury-Homes-Interior-Design-1-1.jpg';

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>(
    debugLabel: "SmartRealtor",
  );

  static LinearGradient gradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      AppColors.assets,
      AppColors.assets.withOpacity(0.8),
      AppColors.assets.withOpacity(0.6),
      AppColors.assets.withOpacity(0.4),
      AppColors.assets.withOpacity(0.2),
      AppColors.assets.withOpacity(0.1),
    ],
  );

  static const borderRadius4 = BorderRadius.all(Radius.circular(4));
  static const borderRadius12 = BorderRadius.all(Radius.circular(12));

  static const spacer = Spacer();
  static const boxWidth4= SizedBox(width: 4);
  static const boxWidth16= SizedBox(width: 16);
  static const boxHeight4= SizedBox(height: 4);
  static const boxHeight8= SizedBox(height: 8);
  static const boxHeight12= SizedBox(height: 12);
  static const boxHeight16 = SizedBox(height: 16);
  static const boxHeight24 = SizedBox(height: 24);

  static const verticalDividerForHeader = VerticalDivider(
    color: Colors.grey,
    thickness: 1,
    width: 0,
  );

  static const marginAll4 = EdgeInsets.all(4);
  static const marginAll6 = EdgeInsets.all(6);
  static const marginAll16 = EdgeInsets.all(16);
  static const marginVertical16 = EdgeInsets.symmetric(vertical: 16);
  static const marginVertical36 = EdgeInsets.symmetric(vertical: 36);

  static const baseShimmerColor = Color(0xff1E1B2B);
  static const disabledButtonColor = Color(0xFF888888);

  static String moneyFormat(num number) {
    final isNegative = number.isNegative;
    number = number.abs();
    String result = "0";
    result = NumberFormat().format(number).split(",").join(" ");
    return isNegative ? "-$result" : result;
  }

}
