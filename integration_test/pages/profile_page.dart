import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../helpers/base_page.dart';
import '../helpers/finder_helper.dart';

/// Page Object para la página de Perfil
class ProfilePage extends BasePage {
  ProfilePage(super.tester);

  // Finders para los elementos de la página
  Finder get userName => FinderHelper.byKey(const Key('user_name'));
  Finder get userEmail => FinderHelper.byKey(const Key('user_email'));
  Finder get editButton => FinderHelper.byKey(const Key('edit_button'));
  Finder get saveButton => FinderHelper.byKey(const Key('save_button'));

  /// Verifica que la página esté cargada
  Future<void> verifyPageLoaded() async {
    await waitForWidget(userName);
    await waitForWidget(userEmail);
  }

  /// Obtiene el nombre del usuario
  String getUserName() {
    return getText(userName);
  }

  /// Obtiene el email del usuario
  String getUserEmail() {
    return getText(userEmail);
  }

  /// Toca el botón de editar
  Future<void> tapEditButton() async {
    await tap(editButton);
  }

  /// Toca el botón de guardar
  Future<void> tapSaveButton() async {
    await tap(saveButton);
  }
}
