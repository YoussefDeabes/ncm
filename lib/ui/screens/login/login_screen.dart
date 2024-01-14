import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncm/_base/widgets/base_stateful_widget.dart';
import 'package:flutter/material.dart';
import 'package:ncm/res/const_colors.dart';
import 'package:ncm/ui/screens/login/bloc/login_bloc.dart';

class LoginScreen extends BaseStatefulWidget {
  static const String routeName = '/login-screen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _LoginScreenState();
}

class _LoginScreenState extends BaseState<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget baseBuild(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColors.appWhite,
      body: _getBody(),
    );
  }

///////////////////////////////////////////////////////////
//////////////////// Widget methods ///////////////////////
///////////////////////////////////////////////////////////

  Widget _getBody() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: height / 15),
                Center(child: Text("Login Screen")),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _getPasswordTextField({required String label}) {
    return SizedBox(
      width: width * 0.85,
      child: TextFormField(
        obscureText: true,
        controller: _passwordController,
        keyboardType: TextInputType.visiblePassword,
        autocorrect: false,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          fillColor: ConstColors.appWhite,
          hintStyle:
              const TextStyle(color: ConstColors.textLightGrey, fontSize: 16),
          hintText: label,
          errorStyle: const TextStyle(color: ConstColors.error),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          isDense: true,
        ),
        validator: (value) {

        },
      ),
    );
  }

  Widget _getEmailTextField({required String label}) {
    return SizedBox(
      width: width * 0.85,
      child: TextFormField(
        controller: _emailController,
        keyboardType: TextInputType.emailAddress,
        autocorrect: false,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          fillColor: ConstColors.appWhite,
          hintStyle:
              const TextStyle(color: ConstColors.textLightGrey, fontSize: 16),
          hintText: label,
          errorStyle: const TextStyle(color: ConstColors.error),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          isDense: true,
        ),
        validator: (value) {

        },
      ),
    );
  }

  Widget _getLoginButton() {
    return SizedBox(
        width: width * 0.85,
        height: 60,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: ElevatedButton(
              onPressed: _onLoginPressed,
              child: const Text(
                "Login",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              )),
        ));
  }

  ///////////////////////////////////////////////////////////
//////////////////// Helper methods ///////////////////////
///////////////////////////////////////////////////////////
  LoginBloc get loginBloc => BlocProvider.of<LoginBloc>(context);

  void _onLoginPressed() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();
  }
}
