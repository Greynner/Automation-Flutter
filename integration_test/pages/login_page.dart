import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../helpers/base_page.dart';
import '../helpers/finder_helper.dart';

/// Page Object para la página de Login
class LoginPage extends BasePage {
  LoginPage(super.tester);

  // Finders para los elementos de la página
  Finder get emailField => FinderHelper.byKey(const Key('email_field'));
  Finder get passwordField => FinderHelper.byKey(const Key('password_field'));
  Finder get loginButton => FinderHelper.byKey(const Key('login_button'));
  Finder get errorMessage => FinderHelper.byKey(const Key('error_message'));

  /// Ingresa el email
  Future<void> enterEmail(String email) async {
    await enterText(emailField, email);
  }

  /// Ingresa la contraseña
  Future<void> enterPassword(String password) async {
    await enterText(passwordField, password);
  }

  /// Toca el botón de login
  Future<void> tapLoginButton() async {
    await tap(loginButton);
  }

  /// Realiza el login completo
  Future<void> login(String email, String password) async {
    await enterEmail(email);
    await enterPassword(password);
    await tapLoginButton();
  }

  /// Verifica que el mensaje de error sea visible
  Future<bool> isErrorMessageVisible() async {
    return await isVisible(errorMessage);
  }

  /// Obtiene el texto del mensaje de error
  String getErrorMessage() {
    return getText(errorMessage);
  }

  /// Verifica que la página esté cargada
  Future<void> verifyPageLoaded() async {
    await waitForWidget(emailField);
    await waitForWidget(passwordField);
    await waitForWidget(loginButton);
  }
}
