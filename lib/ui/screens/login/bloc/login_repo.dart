import 'package:ncm/api/auth_api_manager.dart';
import 'package:ncm/api/errors/error_api_model.dart';
import 'package:ncm/ui/screens/login/bloc/login_bloc.dart';

abstract class BaseLoginRepo {
  Future<LoginState> loginApi();
}

class LoginRepo extends BaseLoginRepo {
  final AuthApiManager? authApiManager;

  LoginRepo({this.authApiManager});

  @override
  Future<LoginState> loginApi() async {
    LoginState? loginState;
    ErrorApiModel? detailsModel;

    return loginState!;
  }
}
