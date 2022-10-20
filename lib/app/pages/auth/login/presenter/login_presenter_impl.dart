import 'package:dart_week_copa/app/core/exceptions/unauthorized_exception.dart';
import 'package:dart_week_copa/app/pages/auth/login/view/login_view.dart';
import 'package:dart_week_copa/app/services/login_service.dart';

import './login_presenter.dart';

class LoginPresenterImpl implements LoginPresenter {
  final LoginService loginService;
  late final LoginView _view;
  LoginPresenterImpl({
    required this.loginService,
  });

  Future<void> login(String email, String password) async {
    try {
      await loginService.execute(
        email: email,
        password: password,
      );
      _view.success();
    } on UnauthorizedException catch (e) {
      _view.error('Erro ao realizar Login');
    }
  }

  @override
  set view(LoginView view) => _view = view;
}
