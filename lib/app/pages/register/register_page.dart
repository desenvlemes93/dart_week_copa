import 'package:dart_week_copa/app/core/ui/styles/colors_app.dart';
import 'package:dart_week_copa/app/core/ui/styles/text_styles.dart';
import 'package:dart_week_copa/app/core/ui/widgets/button.dart';
import 'package:dart_week_copa/app/pages/register/presenter/register_presenter.dart';
import 'package:dart_week_copa/app/pages/register/presenter/register_presenter_impl.dart';
import 'package:dart_week_copa/app/pages/register/view/register_view_impl.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final RegisterPresenter presenter;
  const RegisterPage({
    super.key,
    required this.presenter,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends RegisterViewImpl {
  final _formKey = GlobalKey<FormState>();
  final _nomeEC = TextEditingController();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();
  final _confirmPasswordEC = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _nomeEC.dispose();
    _emailEC.dispose();
    _passwordEC.dispose();
    _confirmPasswordEC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 106.82,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/bola.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Text('Cadastrar Usuário', style: context.textStyles.titleBlack),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nomeEC,
                      decoration: const InputDecoration(
                        label: Text('Nome Completo *'),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _emailEC,
                      decoration: const InputDecoration(
                        label: Text('E-mail *'),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _passwordEC,
                      obscureText: true,
                      decoration: const InputDecoration(
                        label: Text('Senha *'),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      obscureText: true,
                      controller: _confirmPasswordEC,
                      decoration: const InputDecoration(
                        label: Text('Confirma Senha *'),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Button.primary(
                      width: MediaQuery.of(context).size.width * .9,
                      onPressed: () {
                        final _formValid =
                            _formKey.currentState?.validate() ?? false;

                        if (_formValid) {
                          showLoader();
                          widget.presenter.register(
                            name: _nomeEC.text,
                            email: _emailEC.text,
                            password: _passwordEC.text,
                            confirmPassword: _confirmPasswordEC.text,
                          );
                        }
                      },
                      label: 'Cadastrar',
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
