import 'package:dart_week_copa/app/core/ui/styles/button_styles.dart';
import 'package:dart_week_copa/app/core/ui/styles/colors_app.dart';
import 'package:dart_week_copa/app/core/ui/styles/text_styles.dart';
import 'package:dart_week_copa/app/core/ui/widgets/button.dart';
import 'package:dart_week_copa/app/pages/auth/login/presenter/login_presenter.dart';
import 'package:dart_week_copa/app/pages/auth/login/view/login_view_impl.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends StatefulWidget {
  final LoginPresenter presenter;
  const LoginPage({
    super.key,
    required this.presenter,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends LoginViewImpl {
  final _formKey = GlobalKey<FormState>();
  final _emailEC = TextEditingController();
  final _senhaEC = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailEC.dispose();
    _senhaEC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.primary,
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background_login.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: CustomScrollView(
            physics: ScrollPhysics(),
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate.fixed(
                  [
                    SizedBox(
                      height: MediaQuery.of(context).size.height *
                          (MediaQuery.of(context).size.width > 350 ? .30 : .25),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Center(
                        child: Text(
                          'Login',
                          style: context.textStyles.titleWhite,
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: _emailEC,
                      decoration: const InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        label: Text('E-mail'),
                      ),
                      validator: Validatorless.required('Obrigatório'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      obscureText: true,
                      controller: _senhaEC,
                      decoration: const InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        label: Text('Senha'),
                      ),
                      validator: Validatorless.required('Obrigatório'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Esqueceu a senha ?',
                      style: context.textStyles.textPrimaryFontMedium.copyWith(
                        color: context.colors.yellow,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Button(
                      width: MediaQuery.of(context).size.width * .9,
                      onPressed: () {
                        final _formValid =
                            _formKey.currentState?.validate() ?? false;

                        if (_formValid) {
                          widget.presenter.login(
                            _emailEC.text,
                            _senhaEC.text,
                          );
                        }
                      },
                      style: context.buttonStyles.yellowButton,
                      labelStyle: context
                          .textStyles.textSecondaryFontExtraBoldPrimaryColor,
                      label: 'Entrar',
                    ),
                  ],
                ),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(children: [
                  const Spacer(),
                  Text.rich(
                    TextSpan(
                      text: 'Não possui um conta?',
                      children: [
                        TextSpan(
                          text: 'Cadastre-se ',
                          style:
                              context.textStyles.textPrimaryFontMedium.copyWith(
                            color: context.colors.yellow,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Navigator.of(context)
                                .pushNamed('/auth/register'),
                        ),
                      ],
                    ),
                    style: context.textStyles.textSecondaryFontMedium.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
