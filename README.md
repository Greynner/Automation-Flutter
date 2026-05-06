# Automation Interview Littio

A practice repo for **manual QAs who want to learn mobile automation with Flutter**.

The goal is to provide a simple starting point for automation using:

- Flutter `integration_test`
- Dart
- Page Object Model (POM)
- Reusable helpers to find and interact with widgets
- A demo e-wallet app located in `e-wallet/`

## Install dependencies

```bash
flutter pub get
```

## Run tests

### Basic widget test

```bash
flutter test
```

### Integration tests

First, check your available devices:

```bash
flutter devices
```

Then run a specific test:

```bash
flutter test integration_test/login_test.dart -d macos
```

Or use the script:

```bash
./run_tests.sh integration_test/login_test.dart macos
```

## What you can learn here

- How to write Flutter integration tests.
- How to use keys to find widgets.
- How to organize tests with Page Objects.
- How to automate flows like login, navigation, profile, and sending money.
- How to structure a small and maintainable automation framework.

## For manual QAs

If you come from manual testing, this repo is meant to help you take your first steps into automation without starting from scratch.

Start by reading the tests in `integration_test/`, then check how each screen is represented with a Page Object in `integration_test/pages/`.
