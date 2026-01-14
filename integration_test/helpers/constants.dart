/// Constantes utilizadas en los tests
class TestConstants {
  // Timeouts
  static const Duration defaultTimeout = Duration(seconds: 10);
  static const Duration longTimeout = Duration(seconds: 30);
  static const Duration shortTimeout = Duration(seconds: 5);

  // Delays
  static const Duration defaultDelay = Duration(milliseconds: 500);
  static const Duration shortDelay = Duration(milliseconds: 200);
  static const Duration longDelay = Duration(seconds: 2);

  // Credenciales de prueba (NO usar en producción)
  static const String testEmail = 'test@ejemplo.com';
  static const String testPassword = 'password123';
  static const String invalidEmail = 'invalid@ejemplo.com';
  static const String invalidPassword = 'wrongpassword';

  // Textos esperados
  static const String loginTitle = 'Login';
  static const String homeTitle = 'Home';
  static const String profileTitle = 'Perfil';
}
