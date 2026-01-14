# Framework de Automatización Flutter con Integration Test y POM

Framework de automatización para aplicaciones Flutter utilizando `integration_test` y el patrón **Page Object Model (POM)**.

## 📋 Tabla de Contenidos

- [Requisitos](#requisitos)
- [Instalación](#instalación)
- [Estructura del Proyecto](#estructura-del-proyecto)
- [Uso del Framework](#uso-del-framework)
- [Page Object Model](#page-object-model)
- [Ejecutar Tests](#ejecutar-tests)
- [Mejores Prácticas](#mejores-prácticas)

## 🔧 Requisitos

- Flutter SDK (>=3.0.0)
- Dart SDK (>=3.0.0)
- Android Studio / VS Code con extensiones de Flutter
- Dispositivo físico o emulador para ejecutar los tests

## 📦 Instalación

1. **Clonar o navegar al proyecto:**
```bash
cd automation-interviewlittio
```

2. **Instalar dependencias:**
```bash
flutter pub get
```

3. **Verificar la instalación:**
```bash
flutter doctor
```

## 📁 Estructura del Proyecto

```
automation-interviewlittio/
├── integration_test/
│   ├── helpers/
│   │   ├── base_page.dart          # Clase base para Page Objects
│   │   ├── finder_helper.dart       # Helper para crear Finders
│   │   └── test_helper.dart         # Helper para inicializar tests
│   ├── pages/
│   │   ├── login_page.dart          # Page Object de Login
│   │   ├── home_page.dart           # Page Object de Home
│   │   └── profile_page.dart        # Page Object de Perfil
│   ├── app_test.dart                # Tests de integración completos
│   └── login_test.dart              # Tests específicos de login
├── pubspec.yaml                     # Dependencias del proyecto
├── analysis_options.yaml            # Configuración de linter
└── README.md                        # Este archivo
```

## 🚀 Uso del Framework

### Crear un Page Object

Para crear un nuevo Page Object, extiende la clase `BasePage`:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../helpers/base_page.dart';
import '../helpers/finder_helper.dart';

class MiNuevaPage extends BasePage {
  MiNuevaPage(super.tester);

  // Define los finders para los elementos de la página
  Finder get miBoton => FinderHelper.byKey(const Key('mi_boton'));
  Finder get miCampo => FinderHelper.byKey(const Key('mi_campo'));

  // Métodos para interactuar con la página
  Future<void> tapMiBoton() async {
    await tap(miBoton);
  }

  Future<void> ingresarTexto(String texto) async {
    await enterText(miCampo, texto);
  }

  Future<void> verifyPageLoaded() async {
    await waitForWidget(miBoton);
  }
}
```

### Escribir un Test

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'pages/mi_nueva_page.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Mi test de ejemplo', (WidgetTester tester) async {
    // Arrange
    final page = MiNuevaPage(tester);
    
    // Act
    await page.verifyPageLoaded();
    await page.ingresarTexto('Hola Mundo');
    await page.tapMiBoton();
    
    // Assert
    expect(await page.isVisible(page.miBoton), true);
  });
}
```

## 📄 Page Object Model

### BasePage

La clase `BasePage` proporciona métodos comunes para interactuar con widgets:

- `waitForWidget(Finder finder)`: Espera a que un widget sea visible
- `waitForWidgetToDisappear(Finder finder)`: Espera a que un widget desaparezca
- `tap(Finder finder)`: Toca un widget
- `enterText(Finder finder, String text)`: Ingresa texto en un campo
- `getText(Finder finder)`: Obtiene el texto de un widget
- `scrollDown(Finder finder)`: Desliza hacia abajo
- `scrollUp(Finder finder)`: Desliza hacia arriba
- `isVisible(Finder finder)`: Verifica si un widget está visible
- `wait(Duration duration)`: Espera un tiempo determinado

### FinderHelper

Helper para crear Finders de manera más legible:

- `byText(String text)`: Busca por texto
- `byKey(Key key)`: Busca por key
- `byType(Type type)`: Busca por tipo de widget
- `byTooltip(String tooltip)`: Busca por tooltip
- `byIcon(IconData icon)`: Busca por icono
- `byTextContaining(String text)`: Busca por texto parcial

## 🧪 Ejecutar Tests

### Ejecutar todos los tests

```bash
flutter test integration_test/
```

### Ejecutar un test específico

```bash
flutter test integration_test/login_test.dart
```

### Ejecutar en un dispositivo específico

```bash
# Listar dispositivos disponibles
flutter devices

# Ejecutar en un dispositivo específico
flutter test integration_test/app_test.dart -d <device-id>
```

### Ejecutar en modo release

```bash
flutter test integration_test/app_test.dart --release
```

## 💡 Mejores Prácticas

1. **Usar Keys en los Widgets**: Asegúrate de que tu aplicación Flutter use `Key` en los widgets importantes para facilitar la localización en los tests.

2. **Separar Concerns**: Cada Page Object debe representar una sola página o pantalla de la aplicación.

3. **Métodos Reutilizables**: Crea métodos en los Page Objects para acciones comunes que se repiten.

4. **Verificaciones Explícitas**: Siempre verifica que las páginas estén cargadas antes de interactuar con ellas.

5. **Nombres Descriptivos**: Usa nombres claros y descriptivos para los métodos y variables.

6. **Timeout Apropiados**: Ajusta los timeouts según la complejidad de tu aplicación.

7. **Organización**: Mantén los tests organizados por funcionalidad o flujo de usuario.

## 📝 Ejemplo Completo

Ver los archivos de ejemplo:
- `integration_test/pages/login_page.dart` - Ejemplo de Page Object
- `integration_test/login_test.dart` - Ejemplo de test
- `integration_test/app_test.dart` - Tests de integración completos

## 🔍 Troubleshooting

### Error: "No devices found"
- Asegúrate de tener un emulador o dispositivo conectado
- Ejecuta `flutter devices` para verificar

### Error: "Widget not found"
- Verifica que los Keys estén correctamente definidos en la aplicación
- Aumenta el timeout si es necesario
- Verifica que la página esté completamente cargada

### Tests muy lentos
- Usa `pumpAndSettle()` solo cuando sea necesario
- Considera usar `pump()` en lugar de `pumpAndSettle()` para operaciones simples

## 📚 Recursos Adicionales

- [Flutter Integration Testing](https://docs.flutter.dev/testing/integration-tests)
- [Flutter Test Package](https://api.flutter.dev/flutter/flutter_test/flutter_test-library.html)
- [Page Object Model Pattern](https://martinfowler.com/bliki/PageObject.html)

## 🤝 Contribuir

1. Crea una rama para tu feature
2. Implementa tus cambios
3. Asegúrate de que los tests pasen
4. Crea un Pull Request

## 📄 Licencia

Este proyecto es de código abierto y está disponible bajo la licencia MIT.
