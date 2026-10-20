# yesoryes

A Flutter project using the Flame game engine, Forge2D physics, and Lottie assets. The root Dart package is currently named `flutter_application_1`.

## Local setup

Use a Flutter SDK whose bundled Dart version satisfies the exact `3.0.1` constraint in `pubspec.yaml`. Check `flutter --version` before installing dependencies; a newer Dart SDK may not satisfy this pin.

```bash
flutter pub get
flutter run
```

Select a connected device or emulator when prompted. Each target platform requires its own Flutter development toolchain. Run `flutter analyze` for static analysis.

## Repository layout

- `lib/`: Flutter and game code
- `assets/images/`, `assets/lottie/`: assets declared in `pubspec.yaml`
- `android/`, `ios/`, `web/`, `linux/`, `macos/`, `windows/`: platform projects
- `vite-project/`: separate web subproject; the Flutter commands above do not install or run it

Dependency and SDK upgrades should be validated separately rather than changing the version constraints only to bypass installation errors.
