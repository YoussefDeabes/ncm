import 'package:firebase_auth/firebase_auth.dart';
import 'package:ncm/_base/widgets/base_stateful_widget.dart';
import 'package:flutter/material.dart';
import 'package:ncm/res/assets_path.dart';
import 'package:ncm/res/const_colors.dart';
import 'package:ncm/ui/screens/login/login_screen.dart';
import 'package:ncm/ui/widgets/widgets.dart';

class SettingsScreen extends BaseStatefulWidget {
  static const String routeName = '/settings-screen';

  const SettingsScreen({Key? key}) : super(key: key);

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _SettingsScreenState();
}

class _SettingsScreenState extends BaseState<SettingsScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget baseBuild(BuildContext context) {
    return Scaffold(
      body: _getBody(),
    );
  }

///////////////////////////////////////////////////////////
//////////////////// Widget methods ///////////////////////
///////////////////////////////////////////////////////////

  Widget _getBody() {
    return Stack(
      children: [
        Container(
          color: ConstColors.app,
        ),
        SingleChildScrollView(
            child: Container(
          height: height,
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView(
            children: [
              _headerRow(),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        LoginScreen.routeName, (Route<dynamic> route) => false);
                    auth.signOut();
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(ConstColors.secondary)),
                  child: getTextWidget("Logout",
                      fontWeight: FontWeight.w700, fontSize: 18)),
            ],
          ),
        )),
      ],
    );
  }

  //Logo, search and notification icon row
  Widget _headerRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          AssPath.logoMobile,
        ),
        Row(
          children: [
            InkWell(
              onTap: () {
                // _servicesBloc.add(SearchClickedEvt());
              },
              child: Image.asset(
                AssPath.search,
                scale: 1.2,
              ),
            ),
            const SizedBox(width: 20),
            InkWell(
              onTap: () {
                // _servicesBloc.add(NotificationClickedEvt());
              },
              child: Image.asset(
                AssPath.notificationIcon,
                scale: 1.2,
              ),
            )
          ],
        ),
      ],
    );
  }

///////////////////////////////////////////////////////////
//////////////////// Helper methods ///////////////////////
///////////////////////////////////////////////////////////
}
