import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ncm/prefs/pref_manager.dart';
import 'package:ncm/ui/screens/login/bloc/login_repo.dart';
import 'package:ncm/util/validator.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final BaseLoginRepo loginRepository;

  LoginBloc({required BaseLoginRepo loginRepository})
      : loginRepository = loginRepository,
        super(LoginInitial()) {
    on<LoginApiEvent>(_onLoginApiEvent);
    on<ForgetPasswordEvent>(_onForgetPasswordEvent);
    on<RegisterEvent>(_onRegisterEvent);
    on<FailedLoginEvent>(_onFailedLoginEvent);
    on<SuccessLoginEvent>(_onSuccessLoginEvent);
  }

  ///  Login  button Clicked
  _onLoginApiEvent(LoginApiEvent event, emit) async {
    emit(const LoadingLoginState());
    emit(const LoginClickedState());
  }

  ///  Forget password  button Clicked
  _onForgetPasswordEvent(ForgetPasswordEvent event, emit) async {
    emit(const LoadingLoginState());
    emit(const ForgetPasswordState());
  }

  ///  Register  button Clicked
  _onRegisterEvent(RegisterEvent event, emit) async {
    emit(const LoadingLoginState());
    emit(const RegisterState());
  }

  _onFailedLoginEvent(FailedLoginEvent event, emit) async {
    emit(const LoadingLoginState());
    emit(FailedLoginState(event.errorMessage));
  }

  _onSuccessLoginEvent(SuccessLoginEvent event, emit) async {
    emit(const LoadingLoginState());
    emit(SuccessLogin(event.user));
  }
}
