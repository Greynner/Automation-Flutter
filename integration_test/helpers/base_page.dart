import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Clase base para todas las Page Objects
/// Proporciona métodos comunes para interactuar con widgets
abstract class BasePage {
  final WidgetTester tester;

  BasePage(this.tester);

  /// Espera a que un widget sea visible
  Future<void> waitForWidget(Finder finder, {Duration timeout = const Duration(seconds: 10)}) async {
    final endTime = DateTime.now().add(timeout);
    while (DateTime.now().isBefore(endTime)) {
      try {
        expect(finder, findsOneWidget);
        return;
      } catch (e) {
        await tester.pump(const Duration(milliseconds: 100));
      }
    }
    throw TimeoutException('Widget no encontrado: $finder', timeout);
  }

  /// Espera a que un widget desaparezca
  Future<void> waitForWidgetToDisappear(Finder finder, {Duration timeout = const Duration(seconds: 10)}) async {
    final endTime = DateTime.now().add(timeout);
    while (DateTime.now().isBefore(endTime)) {
      try {
        expect(finder, findsNothing);
        return;
      } catch (e) {
        await tester.pump(const Duration(milliseconds: 100));
      }
    }
    throw TimeoutException('Widget aún visible: $finder', timeout);
  }

  /// Toca un widget
  Future<void> tap(Finder finder) async {
    await waitForWidget(finder);
    await tester.tap(finder);
    await tester.pumpAndSettle();
  }

  /// Ingresa texto en un campo
  Future<void> enterText(Finder finder, String text) async {
    await waitForWidget(finder);
    await tester.enterText(finder, text);
    await tester.pumpAndSettle();
  }

  /// Obtiene el texto de un widget
  String getText(Finder finder) {
    final widget = tester.widget<Text>(finder);
    return widget.data ?? '';
  }

  /// Desliza hacia abajo
  Future<void> scrollDown(Finder finder, {double delta = 300}) async {
    await tester.drag(finder, Offset(0, -delta));
    await tester.pumpAndSettle();
  }

  /// Desliza hacia arriba
  Future<void> scrollUp(Finder finder, {double delta = 300}) async {
    await tester.drag(finder, Offset(0, delta));
    await tester.pumpAndSettle();
  }

  /// Verifica que un widget esté visible
  Future<bool> isVisible(Finder finder) async {
    try {
      expect(finder, findsOneWidget);
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Espera un tiempo determinado
  Future<void> wait(Duration duration) async {
    await tester.pump(duration);
  }
}
