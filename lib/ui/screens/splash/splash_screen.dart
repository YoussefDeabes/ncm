import 'dart:async';

import 'package:lottie/lottie.dart';
import 'package:ncm/_base/widgets/base_stateful_widget.dart';
import 'package:ncm/prefs/pref_manager.dart';
import 'package:ncm/res/assets_path.dart';
import 'package:ncm/res/const_colors.dart';
import 'package:ncm/ui/screens/home/home_screen.dart';
import 'package:ncm/ui/screens/login/login_screen.dart';
import 'package:ncm/util/ui/screen_controller.dart';
import 'package:flutter/material.dart';

class SplashScreen extends BaseStatefulWidget {
  static const routeName = '/splash';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _SplashScreenState();
}

class _SplashScreenState extends BaseState<SplashScreen> {
  @override
  void initState() {
    /// to make full screen
    enterFullScreen();

    /// to start time to switch to another screen
    _startTime();
    super.initState();
  }

  @override
  Widget baseBuild(BuildContext context) {
    return Scaffold(
      body:  Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: const BoxDecoration(
              // color: ConstColors.appWhite,
              image: DecorationImage(
                image: AssetImage(AssPath.mainBg),
                fit: BoxFit.cover,
              ),
            ),
            //  child:Image.asset(AssPath.splashBg),

          ),
          Image.asset(
            AssPath.splashAnimation,
            scale: 0.5,
          ),
        ],
      ),
    );
  }

  void _startTime() async {
    var _duration = const Duration(milliseconds: 4000);
    Timer(_duration, _goToNextScreen);
  }

  Future _goToNextScreen() async {
    bool isLoggedIn = await PrefManager.isLoggedIn();
    // Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    if(isLoggedIn){
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    }else {
      Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
    }

  }
}
