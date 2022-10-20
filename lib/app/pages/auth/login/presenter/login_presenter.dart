import 'package:dart_week_copa/app/core/mvp/fwc_presenter.dart';
import 'package:dart_week_copa/app/pages/auth/login/view/login_view.dart';

abstract class LoginPresenter extends FwcPresenter<LoginView> {
  void login(String email, String password);
}
