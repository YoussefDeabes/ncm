import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncm/_base/widgets/base_stateful_widget.dart';
import 'package:flutter/material.dart';
import 'package:ncm/res/assets_path.dart';
import 'package:ncm/res/const_colors.dart';
import 'package:ncm/ui/screens/home/home_screen.dart';
import 'package:ncm/ui/screens/login/bloc/login_bloc.dart';
import 'package:ncm/ui/widgets/widgets.dart';

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
    return SingleChildScrollView(
      child: Stack(
        alignment: Alignment.center,
        children: [
          getBackgroundImage(width: width, height: height),
          ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(16.0),
            ),
            child: Form(
              key: _formKey,
              child: Container(
                width: width * 0.95,
                color: ConstColors.appWhite,
                padding: EdgeInsets.symmetric(horizontal: width / 25),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: height / 30),
                    Image.asset(
                      AssPath.NCMLogo,
                      color: ConstColors.secondary,
                      scale: 1.8,
                    ),
                    getTextWidget("Login",
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: ConstColors.app),
                    SizedBox(height: height / 50),
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: getTextWidget("Username",
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: ConstColors.app),
                    ),
                    SizedBox(height: height / 95),
                    _getEmailTextField(label: "Username"),
                    SizedBox(height: height / 50),
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: getTextWidget("Password",
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: ConstColors.app),
                    ),
                    SizedBox(height: height / 95),
                    _getPasswordTextField(label: "Password"),
                    SizedBox(height: height / 50),
                    _getLoginButton(),
                    SizedBox(height: height / 50),
                    TextButton(onPressed: () {},
                        child: getTextWidget(
                            "Forgot Password?", color: ConstColors.app)),
                    SizedBox(height: height / 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      getTextWidget("Not a member?",color: ConstColors.app),
                      TextButton(onPressed: () {},
                          child: getTextWidget(
                              "Register", color: ConstColors.secondary)),
                    ],),
                    SizedBox(height: height / 30),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getPasswordTextField({required String label}) {
    return SizedBox(
      // width: width * 0.85,
      child: TextFormField(
        obscureText: true,
        controller: _passwordController,
        keyboardType: TextInputType.visiblePassword,
        autocorrect: false,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          fillColor: ConstColors.appWhite,
          hintStyle:
          const TextStyle(color: ConstColors.app, fontSize: 16),
          hintText: label,
          errorStyle: const TextStyle(color: ConstColors.error),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          isDense: true,
        ),
        validator: (value) {},
      ),
    );
  }

  Widget _getEmailTextField({required String label}) {
    return SizedBox(
      // width: width * 0.85,
      child: TextFormField(
        controller: _emailController,
        keyboardType: TextInputType.emailAddress,
        autocorrect: false,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          fillColor: ConstColors.app,
          focusColor: ConstColors.app,
          hintStyle:
          const TextStyle(color: ConstColors.app, fontSize: 16),
          hintText: label,
          errorStyle: const TextStyle(color: ConstColors.error),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          // isDense: true,
        ),
        validator: (value) {},
        onSaved: (value) {},
      ),
    );
  }

  Widget _getLoginButton() {
    return SizedBox(
        width: width,
        height: 60,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: ElevatedButton(
              onPressed: _onLoginPressed,
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      ConstColors.secondary)
              ),
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
    Navigator.of(context).pushNamed(HomeScreen.routeName);
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();
  }
}
