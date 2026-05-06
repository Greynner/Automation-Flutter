import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:my_vault/main.dart' as app;
import 'pages/login_page.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Send money flow works', (tester) async {
    app.main();
    await tester.pumpAndSettle();

    final loginPage = LoginPage(tester);
    await loginPage.login('usuario@ejemplo.com', 'password123');

    // Go to Send Money
    await tester.tap(find.byKey(const Key('home.sendMoney')));
    await tester.pumpAndSettle();

    // Fill form
    await tester.enterText(find.byKey(const Key('send.recipient')), 'alice');
    await tester.enterText(find.byKey(const Key('send.amount')), '50');
    await tester.tap(find.byKey(const Key('confirm.send')));
    await tester.pumpAndSettle();

    // Assert success
    expect(find.byKey(const Key('success.title')), findsOneWidget);
    expect(find.text('Transfer successful'), findsOneWidget);
  });
}
