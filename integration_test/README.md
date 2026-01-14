# Tests de Integración

Este directorio contiene todos los tests de integración del framework.

## Estructura

```
integration_test/
├── helpers/          # Clases base y helpers
├── pages/            # Page Objects (POM)
├── app_test.dart     # Tests de integración completos
└── login_test.dart   # Tests específicos de login
```

## Cómo usar

### 1. Crear un nuevo Page Object

Crea un archivo en `pages/` extendiendo `BasePage`:

```dart
import '../helpers/base_page.dart';
import '../helpers/finder_helper.dart';

class MiPage extends BasePage {
  MiPage(super.tester);
  
  Finder get miElemento => FinderHelper.byKey(const Key('mi_key'));
  
  Future<void> hacerAlgo() async {
    await tap(miElemento);
  }
}
```

### 2. Crear un nuevo test

Crea un archivo de test en la raíz de `integration_test/`:

```dart
import 'package:integration_test/integration_test.dart';
import 'pages/mi_page.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  
  testWidgets('Mi test', (tester) async {
    final page = MiPage(tester);
    await page.hacerAlgo();
  });
}
```

## Ejecutar tests

```bash
# Todos los tests
flutter test integration_test/

# Test específico
flutter test integration_test/mi_test.dart
```
