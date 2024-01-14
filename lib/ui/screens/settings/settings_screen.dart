import 'package:ncm/_base/widgets/base_stateful_widget.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends BaseStatefulWidget {
  static const String routeName = '/settings-screen';

  const SettingsScreen({Key? key}) : super(key: key);

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _SettingsScreenState();
}

class _SettingsScreenState extends BaseState<SettingsScreen> {
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
    return const SafeArea(
      child: SingleChildScrollView(
          child: Center(
            child: Text("Settings screen"),
          )),
    );
  }

///////////////////////////////////////////////////////////
//////////////////// Helper methods ///////////////////////
///////////////////////////////////////////////////////////
}
