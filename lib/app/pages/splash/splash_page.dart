import 'package:dart_week_copa/app/core/ui/helpers/loader.dart';
import 'package:dart_week_copa/app/core/ui/helpers/messages.dart';
import 'package:dart_week_copa/app/core/ui/styles/button_styles.dart';
import 'package:dart_week_copa/app/core/ui/styles/colors_app.dart';
import 'package:dart_week_copa/app/core/ui/styles/text_styles.dart';

import 'package:dart_week_copa/app/core/ui/widgets/button.dart';
import 'package:dart_week_copa/app/core/ui/widgets/rounded_button.dart';
import 'package:dart_week_copa/app/pages/splash/presenter/splash_presenter.dart';
import 'package:dart_week_copa/app/pages/splash/view/splash_view_impl.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  final SplashPresenter presenter;
  const SplashPage({
    super.key,
    required this.presenter,
  });

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends SplashViewImpl {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.primary,
      body: Center(
        child: DecoratedBox(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background_splash.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * .08),
                  child: Image.asset(
                    'assets/images/fifa_logo.png',
                    height: MediaQuery.of(context).size.height * .25,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height * .19),
                  child: Button(
                    width: MediaQuery.of(context).size.width * 0.9,
                    onPressed: () => widget.presenter.checkLogin(),
                    style: context.buttonStyles.yellowButton,
                    labelStyle: context
                        .textStyles.textSecondaryFontExtraBoldPrimaryColor,
                    label: 'Acessar',
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Image.asset('assets/images/bandeiras.png'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
