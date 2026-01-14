import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../helpers/base_page.dart';
import '../helpers/finder_helper.dart';

/// Page Object para la página de Home
class HomePage extends BasePage {
  HomePage(super.tester);

  // Finders para los elementos de la página
  Finder get welcomeMessage => FinderHelper.byKey(const Key('welcome_message'));
  Finder get logoutButton => FinderHelper.byKey(const Key('logout_button'));
  Finder get profileButton => FinderHelper.byKey(const Key('profile_button'));

  /// Verifica que la página esté cargada
  Future<void> verifyPageLoaded() async {
    await waitForWidget(welcomeMessage);
  }

  /// Obtiene el mensaje de bienvenida
  String getWelcomeMessage() {
    return getText(welcomeMessage);
  }

  /// Toca el botón de logout
  Future<void> tapLogoutButton() async {
    await tap(logoutButton);
  }

  /// Toca el botón de perfil
  Future<void> tapProfileButton() async {
    await tap(profileButton);
  }

  /// Verifica que el usuario esté logueado
  Future<bool> isUserLoggedIn() async {
    return await isVisible(welcomeMessage);
  }
}
