import 'package:fluttertoast/fluttertoast.dart';

import '../utils/app_colors.dart';

Future<bool?> buildToast({
  required String msg,
}) {
  return Fluttertoast.showToast(
      msg: msg,
      backgroundColor: AppColors.darkMainTextColor,
      textColor: AppColors.blackColor,
      timeInSecForIosWeb: 2);
}
