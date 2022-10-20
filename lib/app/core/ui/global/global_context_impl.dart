import 'package:dart_week_copa/app/core/ui/styles/colors_app.dart';
import 'package:dart_week_copa/app/repository/auth/auth_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import './global_context.dart';

class GlobalContextImpl implements GlobalContext {
  final GlobalKey<NavigatorState> navigatorkey;
  final AuthRepository authRepository;
  GlobalContextImpl({
    required this.navigatorkey,
    required this.authRepository,
  });
  @override
  Future<void> expireLogin() async {
    final sp = await SharedPreferences.getInstance();
    sp.clear();
    showTopSnackBar(
      navigatorkey.currentState!.context,
      CustomSnackBar.error(
        backgroundColor: ColorsApp.i.primary,
        message: 'Login Expirado',
      ),
      overlayState: navigatorkey.currentState!.overlay,
    );
    navigatorkey.currentState!
        .pushNamedAndRemoveUntil('/auth/login', (route) => false);
  }
}
