import 'package:ncm/_base/widgets/base_stateful_widget.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends BaseStatefulWidget {
  static const String routeName = '/dashboard-screen';

  const DashboardScreen({Key? key}) : super(key: key);

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _DashboardScreenState();
}

class _DashboardScreenState extends BaseState<DashboardScreen> {
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
        child: Text("Dashboard screen"),
      )),
    );
  }

///////////////////////////////////////////////////////////
//////////////////// Helper methods ///////////////////////
///////////////////////////////////////////////////////////
}
