import 'package:integration_test/integration_test.dart';

/// Helper para inicializar los tests de integración
class TestHelper {
  static IntegrationTestWidgetsFlutterBinding? _binding;

  /// Inicializa el binding de integration_test
  static void initialize() {
    _binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized()
        as IntegrationTestWidgetsFlutterBinding;
    // Nota: IntegrationTestWidgetsFlutterBinding no tiene framePolicy
    // Los integration tests ya se ejecutan en modo "fully live" por defecto
  }

  /// Obtiene el binding actual
  static IntegrationTestWidgetsFlutterBinding? get binding => _binding;
}
