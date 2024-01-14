import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncm/_base/widgets/base_stateful_widget.dart';
import 'package:ncm/bloc/internet_connection_bloc/internet_connection_bloc.dart';
import 'package:ncm/util/ui/feedback_controller.dart';

/// BaseState screenCreateState();
abstract class BaseScreenWidget extends BaseStatefulWidget {
  const BaseScreenWidget({Key? key}) : super(key: key);

  @override
  BaseState baseCreateState() => screenCreateState();

  BaseState screenCreateState();
}

/// buildScreenWidget
abstract class BaseScreenState<W extends BaseScreenWidget>
    extends BaseState<W> {
  @override
  Widget baseBuild(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        BlocConsumer<InternetConnectionBloc, InternetConnectionState>(
          listener: (context, state) {
            // if (!state.isConnected) {
            //   showToast("No Internet Connection");
            //   log("No Internet Connection");
            // }
          },
          builder: (context, state) {
            // if (!state.isConnected && state.isInitApp) {
            //   return noInterNetWidget();
            // }
            // return const SafeArea(child: SizedBox.shrink());

            //! the coming line always returned
            return const SizedBox.shrink();
          },
        ),
        Expanded(child: buildScreenWidget(context))
      ],
    );
  }

  Widget buildScreenWidget(BuildContext context);

  Widget noInterNetWidget() {
    //if error is true then show error message box
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(5.0),
        color: Colors.red,
        child: Row(children: const [
          Icon(Icons.info, size: 11.0, color: Colors.white),
          SizedBox(width: 10.0),
          Text("No Internet Connection Available",
              style: TextStyle(fontSize: 11, color: Colors.white)),
        ]),
      ),
    );
  }
}
