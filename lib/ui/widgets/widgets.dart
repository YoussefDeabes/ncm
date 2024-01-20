import 'package:flutter/material.dart';
import 'package:ncm/res/assets_path.dart';
import 'package:ncm/res/const_colors.dart';
import 'package:ncm/util/lang/app_localization.dart';
import 'package:ncm/util/lang/app_localization_keys.dart';

Widget noData(AppLocalizations appLocal) {
  return Center(
    child: Text(appLocal.translate(LangKeys.noData)),
  );
}

/// reference
/// https://stackoverflow.com/a/55796929/2172590
Widget getEmptyWidget() {
  return const SizedBox.shrink();
}

Widget continueWithLineDivider({double? height, double? width}) {
  return Container(
    color: ConstColors.accent,
    width: width ?? double.infinity,
    height: height ?? 1,
    margin: const EdgeInsets.only(left: 25, right: 25),
  );
}

Widget lineDivider({double? height, double? width}) {
  return Container(
      color: ConstColors.disabled,
      width: width ?? double.infinity,
      height: height ?? 1);
}

//Get any text with optional params
Widget getTextWidget(String text,
    {Color? color, double? fontSize, FontWeight? fontWeight}) {
  return Text(
    text,
    style:
    TextStyle(color: color ?? ConstColors.appWhite, fontSize: fontSize, fontWeight: fontWeight),
  );
}

//Main background image
Widget getBackgroundImage({required double width,required double height}) {
  return Image.asset(
    AssPath.mainBg,
    width: width,
    height: height,
    fit: BoxFit.cover,
  );
}
