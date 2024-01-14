import 'package:flutter/material.dart';
import 'package:ncm/_base/platform_manager.dart';
import 'package:ncm/_base/screen_sizer.dart';
import 'package:ncm/_base/themer.dart';
import 'package:ncm/_base/translator.dart';

// ignore: must_be_immutable
abstract class BaseStatelessWidget extends StatelessWidget
    with Translator, ScreenSizer, Themer, PlatformManager {
  BaseStatelessWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    initTranslator(context);
    initScreenSizer(context);
    initThemer(context);
    return baseBuild(context);
  }

  Widget baseBuild(BuildContext context);
}
