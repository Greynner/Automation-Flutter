#!/bin/bash

# Script para ejecutar los tests de integración
# Uso: ./run_tests.sh [test_file]

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
if [ -z "$1" ]; then
    echo "🧪 Ejecutando todos los tests..."
    flutter test integration_test/
else
    echo "🧪 Ejecutando test: $1"
    flutter test "$1"
fi

echo "✅ Tests completados!"
