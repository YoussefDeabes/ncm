import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncm/_base/widgets/base_stateless_widget.dart';
import 'package:ncm/bloc/lang/language_cubit.dart';
import 'package:ncm/res/const_colors.dart';
import 'package:ncm/ui/widgets/widgets.dart';
import 'package:ncm/util/lang/app_localization_keys.dart';

/// choose the language button and it's popUps
/// ignore: must_be_immutable
class ChooseLanguageWidget extends BaseStatelessWidget {
  ChooseLanguageWidget({Key? key}) : super(key: key);
  TextStyle listTextStyle = const TextStyle(
      color: ConstColors.text, fontWeight: FontWeight.w500, fontSize: 14);

  // english text widget
  Text englishTextWidget = const Text(
    'English',
    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
  );

  // arabic text widget
  Text arabicTextWidget = const Text(
    'العربية',
    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
  );

  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<LanguageCubit, Locale>(
      listener: (context, state) {},
      builder: (context, state) {
        LanguageCubit languageCubit = context.watch<LanguageCubit>();
        return ElevatedButton(
            onPressed: () async {
              languageCubit.switchLanguage();
            },
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(ConstColors.secondary)),
            child: getTextWidget(translate(LangKeys.changeLanguage),
                fontWeight: FontWeight.w700, fontSize: 18));
      },
    );
  }

///////////////////////////////////////////////////////////
//////////////////// Widget methods ///////////////////////
///////////////////////////////////////////////////////////

  /// get the language on pressed to check which platform user use
  // Function() _getChangeLanguageOnPressed(BuildContext context) {}

  // get Modal Bottom Sheet for Android
  // _getModalBottomSheet(BuildContext context) {
  //   return showModalBottomSheet<void>(
  //     context: context,
  //     shape: const RoundedRectangleBorder(
  //       borderRadius: BorderRadius.only(
  //           topRight: Radius.circular(16), topLeft: Radius.circular(16)),
  //     ),
  //     builder: (BuildContext context) {
  //       return Padding(
  //         padding: const EdgeInsets.all(20.0),
  //         child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: <Widget>[
  //             Padding(
  //               padding: const EdgeInsets.only(bottom: 20.0),
  //               child: Text(
  //                 translate(LangKeys.changeLanguage),
  //                 style: const TextStyle(
  //                     fontSize: 14, fontWeight: FontWeight.w500),
  //               ),
  //             ),
  //             // change the app language to english
  //             TextButton(
  //               child: englishTextWidget,
  //               onPressed: () => _changeToEnglish(context),
  //             ),
  //             // change the app language to arabic
  //             TextButton(
  //               child: arabicTextWidget,
  //               onPressed: () => _changeToArabic(context),
  //             )
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }

///////////////////////////////////////////////////////////
//////////////////// Helper methods ///////////////////////
///////////////////////////////////////////////////////////

  String _getCurrentLanguageUserChoose(String languageCode) {
    switch (languageCode) {
      case 'ar':
        return "En";
      case 'en':
        return "ع";
      default:
        return "En";
    }
  }
}
// return TextButton(
// onPressed: () {
// languageCubit.switchLanguage();
// },
// child: SizedBox(
// width: width,
// child: Row(
// mainAxisAlignment: MainAxisAlignment.start,
// children: [
// Container(padding: EdgeInsets.zero,child: SvgPicture.asset(AssPath.changeLangIcon,)),
// const SizedBox(width: 10,),
// Text(translate(LangKeys.changeLanguage), style: listTextStyle),
// const Expanded(child: SizedBox()),
// Text(
// _getCurrentLanguageUserChoose(
// languageCubit.state.languageCode),
// style: listTextStyle),
// ],
// ),
// ),
// );
