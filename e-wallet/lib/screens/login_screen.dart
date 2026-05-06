import 'package:flutter/material.dart';
import 'package:my_vault/common/progress_dialog_helper.dart';
import 'package:my_vault/components/rounded_button.dart';
import 'package:my_vault/components/rounded_text_form_field.dart';
import 'package:my_vault/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  static const route = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _errorMessage;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login(BuildContext context) {
    final email = _emailController.text.trim();
    final password = _passwordController.text;

    if (email != 'usuario@ejemplo.com' || password != 'password123') {
      setState(() {
        _errorMessage = 'Credenciales inválidas';
      });
      return;
    }

    setState(() {
      _errorMessage = null;
    });
    ProgressDialogHelper.show(context, message: 'Logging in..');
    Future.delayed(const Duration(milliseconds: 300)).then((value) {
      if (!mounted) return;
      ProgressDialogHelper.hide(context);
      Navigator.of(context).pushReplacementNamed(HomeScreen.route);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          height: size.height,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 0,
                right: -20,
                child: Image.asset(
                  'assets/images/deco_4.png',
                  width: size.width * 0.5,
                  errorBuilder: (context, error, stackTrace) => Container(),
                ),
              ),
              Positioned(
                bottom: -20,
                left: 10,
                child: Image.asset(
                  'assets/images/deco_5.png',
                  width: size.width * 0.4,
                  errorBuilder: (context, error, stackTrace) => Container(),
                ),
              ),
              Positioned(
                bottom: size.height * 0.4,
                child: Image.asset(
                  'assets/images/person_2.png',
                  width: size.width * 0.85,
                  errorBuilder: (context, error, stackTrace) => Container(),
                ),
              ),
              Positioned(
                bottom: size.height * 0.05,
                child: Form(
                  child: Column(
                    children: [
                      RoundedTextFormField(
                        key: const Key('email_field'),
                        controller: _emailController,
                        hintText: 'Email',
                        prefixIcon: Icons.email,
                      ),
                      const SizedBox(height: 4),
                      RoundedTextFormField(
                        key: const Key('password_field'),
                        controller: _passwordController,
                        hintText: 'Password',
                        obscureText: true,
                        prefixIcon: Icons.lock,
                        suffixIcon: Icons.visibility,
                      ),
                      if (_errorMessage != null) ...[
                        const SizedBox(height: 8),
                        Text(
                          _errorMessage!,
                          key: const Key('error_message'),
                          style: const TextStyle(color: Colors.red),
                        ),
                      ],
                      const SizedBox(height: 24),
                      RoundedButton(
                        key: const Key('login_button'),
                        title: 'Login',
                        press: () => _login(context),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
