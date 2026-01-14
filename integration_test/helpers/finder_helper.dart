import 'package:flutter_test/flutter_test.dart';

/// Helper para crear Finders de manera más legible
class FinderHelper {
  /// Busca por texto
  static Finder byText(String text) => find.text(text);

  /// Busca por key
  static Finder byKey(Key key) => find.byKey(key);

  /// Busca por tipo de widget
  static Finder byType(Type type) => find.byType(type);

  /// Busca por tooltip
  static Finder byTooltip(String tooltip) => find.byTooltip(tooltip);

  /// Busca por icono
  static Finder byIcon(IconData icon) => find.byIcon(icon);

  /// Busca por texto parcial
  static Finder byTextContaining(String text) => find.textContaining(text);

  /// Busca un widget que contenga el texto
  static Finder byWidgetWithText(Type widgetType, String text) {
    return find.descendant(
      of: find.byType(widgetType),
      matching: find.text(text),
    );
  }
}
