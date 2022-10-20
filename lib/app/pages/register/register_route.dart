import 'package:dart_week_copa/app/pages/register/presenter/register_presenter.dart';
import 'package:dart_week_copa/app/pages/register/presenter/register_presenter_impl.dart';
import 'package:dart_week_copa/app/pages/register/register_page.dart';
import 'package:flutter/material.dart';

import 'package:flutter_getit/flutter_getit.dart';

class RegisterRoute extends FlutterGetItPageRoute {
  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<RegisterPresenter>(
            (i) => RegisterPresenterImpl(authRepository: i()))
      ];
  @override
  WidgetBuilder get page => (context) => RegisterPage(presenter: context.get());
}
