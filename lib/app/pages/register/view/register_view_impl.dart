import 'package:dart_week_copa/app/core/ui/helpers/messages.dart';
import 'package:dart_week_copa/app/pages/register/register_page.dart';
import 'package:flutter/material.dart';

import '../../../core/ui/helpers/loader.dart';
import './register_view.dart';

abstract class RegisterViewImpl extends State<RegisterPage>
    with Messages<RegisterPage>, Loader<RegisterPage>
    implements RegisterView {
  @override
  void initState() {
    widget.presenter.view = this;
  }

  @override
  void registerError([String? message]) {
    hideLoader();
    showError(message ?? 'Erro ao registar usuário');
  }

  @override
  void registerSuccess() {
    hideLoader();
    showSuccess('Usuario cadastrado com sucesso');
    Navigator.of(context).pop();
  }
}
