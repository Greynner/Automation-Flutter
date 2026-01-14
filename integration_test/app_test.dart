import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'helpers/test_helper.dart';
import 'pages/login_page.dart';
import 'pages/home_page.dart';
import 'pages/profile_page.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Tests de Integración - App Completa', () {
    testWidgets('Login exitoso y navegación a Home', (WidgetTester tester) async {
      // Arrange
      final loginPage = LoginPage(tester);
      
      // Act - Verificar que la página de login esté cargada
      await loginPage.verifyPageLoaded();
      
      // Act - Realizar login
      await loginPage.login('usuario@ejemplo.com', 'password123');
      
      // Assert - Verificar que se navegó a Home
      final homePage = HomePage(tester);
      await homePage.verifyPageLoaded();
      expect(await homePage.isUserLoggedIn(), true);
    });

    testWidgets('Login fallido muestra mensaje de error', (WidgetTester tester) async {
      // Arrange
      final loginPage = LoginPage(tester);
      
      // Act
      await loginPage.verifyPageLoaded();
      await loginPage.login('usuario@incorrecto.com', 'password123');
      
      // Assert
      expect(await loginPage.isErrorMessageVisible(), true);
      final errorMessage = loginPage.getErrorMessage();
      expect(errorMessage, isNotEmpty);
    });

    testWidgets('Navegación a perfil desde Home', (WidgetTester tester) async {
      // Arrange
      final loginPage = LoginPage(tester);
      final homePage = HomePage(tester);
      
      // Act - Login
      await loginPage.verifyPageLoaded();
      await loginPage.login('usuario@ejemplo.com', 'password123');
      await homePage.verifyPageLoaded();
      
      // Act - Navegar a perfil
      await homePage.tapProfileButton();
      
      // Assert - Verificar que se cargó la página de perfil
      final profilePage = ProfilePage(tester);
      await profilePage.verifyPageLoaded();
      expect(profilePage.getUserName(), isNotEmpty);
      expect(profilePage.getUserEmail(), isNotEmpty);
    });

    testWidgets('Logout desde Home', (WidgetTester tester) async {
      // Arrange
      final loginPage = LoginPage(tester);
      final homePage = HomePage(tester);
      
      // Act - Login
      await loginPage.verifyPageLoaded();
      await loginPage.login('usuario@ejemplo.com', 'password123');
      await homePage.verifyPageLoaded();
      
      // Act - Logout
      await homePage.tapLogoutButton();
      
      // Assert - Verificar que se volvió a la página de login
      await loginPage.verifyPageLoaded();
    });
  });
}
