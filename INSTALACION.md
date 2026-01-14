# Guía de Instalación de Flutter

## Instalación de Flutter en macOS

### Opción 1: Instalación usando Homebrew (Recomendado)

```bash
# Instalar Flutter usando Homebrew
brew install --cask flutter

# Verificar la instalación
flutter doctor
```

### Opción 2: Instalación Manual

1. **Descargar Flutter SDK:**
```bash
cd ~
git clone https://github.com/flutter/flutter.git -b stable
```

2. **Agregar Flutter al PATH:**
Agrega estas líneas a tu archivo `~/.zshrc`:
```bash
export PATH="$PATH:$HOME/flutter/bin"
```

3. **Recargar la configuración:**
```bash
source ~/.zshrc
```

4. **Verificar la instalación:**
```bash
flutter doctor
```

### Opción 3: Usando FVM (Flutter Version Management)

```bash
# Instalar FVM
brew tap leoafarias/fvm
brew install fvm

# Instalar Flutter estable
fvm install stable
fvm use stable

# Agregar al PATH
export PATH="$PATH:$HOME/fvm/default/bin"
```

## Después de Instalar Flutter

1. **Aceptar las licencias:**
```bash
flutter doctor --android-licenses
```

2. **Instalar dependencias del proyecto:**
```bash
cd /Users/greynnermorenomarcano/projects/automation-interviewlittio
flutter pub get
```

3. **Verificar que todo esté correcto:**
```bash
flutter doctor -v
```

## Requisitos Adicionales

- **Xcode** (para desarrollo iOS): Instalar desde App Store
- **Android Studio** (para desarrollo Android): Descargar desde [developer.android.com](https://developer.android.com/studio)
- **VS Code** (opcional pero recomendado): Con extensiones de Flutter y Dart

## Solución de Problemas

### Error: "command not found: flutter"
- Verifica que Flutter esté en tu PATH
- Ejecuta `source ~/.zshrc` después de agregar Flutter al PATH

### Error: "Android licenses not accepted"
```bash
flutter doctor --android-licenses
```

### Verificar instalación
```bash
flutter doctor
```
