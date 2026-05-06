#!/bin/bash

# Script para ejecutar los tests de integración
# Uso: ./run_tests.sh [test_file] [device_id]
# Ejemplo: ./run_tests.sh integration_test/login_test.dart macos

echo "🚀 Ejecutando tests de integración Flutter..."

# Verificar que Flutter esté instalado
if ! command -v flutter &> /dev/null; then
    echo "❌ Flutter no está instalado. Por favor instala Flutter primero."
    exit 1
fi

# Obtener dependencias
echo "📦 Obteniendo dependencias..."
flutter pub get

# Verificar dispositivos disponibles
echo "📱 Dispositivos disponibles:"
flutter devices

# Ejecutar tests
TEST_TARGET=${1:-integration_test/}
DEVICE_ID=${2:-${DEVICE_ID:-}}

DEVICE_ARGS=()
if [ -n "$DEVICE_ID" ]; then
    DEVICE_ARGS=(-d "$DEVICE_ID")
fi

if [ -z "$1" ]; then
    echo "🧪 Ejecutando todos los tests..."
else
    echo "🧪 Ejecutando test: $TEST_TARGET"
fi

flutter test "$TEST_TARGET" "${DEVICE_ARGS[@]}"

echo "✅ Tests completados!"
