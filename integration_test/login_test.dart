import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:my_vault/main.dart' as app;
import 'pages/login_page.dart';
import 'pages/home_page.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Tests de Login', () {
    testWidgets('Debería mostrar campos de email y password', (WidgetTester tester) async {
      // Arrange - Inicializar la app
      app.main();
      await tester.pumpAndSettle();

      final loginPage = LoginPage(tester);

      // Act & Assert
      await loginPage.verifyPageLoaded();
    });

    testWidgets('Debería permitir ingresar email y password', (WidgetTester tester) async {
      // Arrange - Inicializar la app
      app.main();
      await tester.pumpAndSettle();

      final loginPage = LoginPage(tester);

      // Act
      await loginPage.verifyPageLoaded();
      await loginPage.enterEmail('test@ejemplo.com');
      await loginPage.enterPassword('test123');

      // Assert - Si llegamos aquí sin errores, los campos aceptaron el texto
      expect(await loginPage.isVisible(loginPage.emailField), true);
      expect(await loginPage.isVisible(loginPage.passwordField), true);
    });

    testWidgets('Debería navegar a Home después de login exitoso', (WidgetTester tester) async {
      // Arrange - Inicializar la app
      app.main();
      await tester.pumpAndSettle();

      final loginPage = LoginPage(tester);
      final homePage = HomePage(tester);

      // Act
      await loginPage.verifyPageLoaded();
      await loginPage.login('usuario@ejemplo.com', 'password123');

      // Assert
      await homePage.verifyPageLoaded();
      expect(await homePage.isUserLoggedIn(), true);
    });
  });
}
