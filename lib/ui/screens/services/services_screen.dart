import 'package:ncm/_base/widgets/base_stateful_widget.dart';
import 'package:flutter/material.dart';

class ServicesScreen extends BaseStatefulWidget {
  static const String routeName = '/services-screen';

  const ServicesScreen({Key? key}) : super(key: key);

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _ServicesScreenState();
}

class _ServicesScreenState extends BaseState<ServicesScreen> {
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
            child: Text("Services screen"),
          )),
    );
  }

///////////////////////////////////////////////////////////
//////////////////// Helper methods ///////////////////////
///////////////////////////////////////////////////////////
}
