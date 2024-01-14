import 'package:bloc/bloc.dart';
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
  }

  ///  Login  button Clicked
  _onLoginApiEvent(LoginApiEvent event, emit) async {

  }
}
