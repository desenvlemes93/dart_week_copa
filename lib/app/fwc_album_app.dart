import 'package:dart_week_copa/app/core/rest/custom_dio.dart';
import 'package:dart_week_copa/app/core/ui/global/global_context.dart';
import 'package:dart_week_copa/app/core/ui/global/global_context_impl.dart';
import 'package:dart_week_copa/app/core/ui/theme/theme_config.dart';

import 'package:dart_week_copa/app/pages/auth/login/login_route.dart';
import 'package:dart_week_copa/app/pages/home/home_page.dart';
import 'package:dart_week_copa/app/pages/home/home_route.dart';
import 'package:dart_week_copa/app/pages/my_stickers/my_sticker_route.dart';
import 'package:dart_week_copa/app/pages/my_stickers/my_stickers_page.dart';
import 'package:dart_week_copa/app/pages/splash/splash_route.dart';
import 'package:dart_week_copa/app/repository/auth/auth_repository.dart';
import 'package:dart_week_copa/app/repository/auth/auth_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

import 'pages/register/register_route.dart';

class FwcAlbumApp extends StatelessWidget {
  final navigatorKey = GlobalKey<NavigatorState>();

  FwcAlbumApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterGetItApplicationBinding(
      bindingsBuilder: () => [
        Bind.lazySingleton<CustomDio>(
          (i) => CustomDio(),
        ),
        Bind.lazySingleton<AuthRepository>(
          (i) => AuthRepositoryImpl(
            dio: i(),
          ),
        ),
        Bind.lazySingleton<GlobalContext>((i) =>
            GlobalContextImpl(navigatorkey: navigatorKey, authRepository: i())),
      ],
      child: MaterialApp(
        title: 'Fifa World Cup Album ',
        theme: ThemeConfig.theme,
        navigatorKey: navigatorKey,
        routes: {
          '/': (_) => SplashRoute(),
          '/home': (_) => HomeRoute(),
          '/auth/register': (_) => RegisterRoute(),
          '/auth/login': (_) => const LoginRoute(),
          '/my-stickers': (_) => MyStickerRoute(),
        },
      ),
    );
  }
}
