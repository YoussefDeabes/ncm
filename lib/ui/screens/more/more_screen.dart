import 'package:ncm/_base/widgets/base_stateful_widget.dart';
import 'package:flutter/material.dart';

class MoreScreen extends BaseStatefulWidget {
  static const String routeName = '/more-screen';

  const MoreScreen({Key? key}) : super(key: key);

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _MoreScreenState();
}

class _MoreScreenState extends BaseState<MoreScreen> {
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
            child: Text("More screen"),
          )),
    );
  }

///////////////////////////////////////////////////////////
//////////////////// Helper methods ///////////////////////
///////////////////////////////////////////////////////////
}
