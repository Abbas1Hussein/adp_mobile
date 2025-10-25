### 🧪 Running Multiple Tests

To run the tests, make sure to specify the correct platform on:

#### Android
```bash
flutter test --dart-define=platform="android"
````

#### iOS

```bash
flutter test --dart-define=platform="iOS"
```

### 🧩 Running a Single Test File

If you want to run a specific test file, you **must** provide the `platform` parameter to the `initializeMobileDefaultsTests` method.

Example:

```dart
initializeMobileDefaultsTests(MobileTargetPlatform.android);
```
or

```dart
initializeMobileDefaultsTests(MobileTargetPlatform.iOS);
```