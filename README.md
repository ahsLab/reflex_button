
# Reflex Button

A Flutter package that provides five beautifully animated and customizable button widgets to enhance user interaction.

## 🚀 Features

- `BounceReflexButton` – Scales down on press for a tactile bounce effect
- `RippleReflexButton` – InkWell-style ripple animation
- `LoadingReflexButton` – Shows a spinner while an async action completes
- `IconReflexButton` – Combines an icon with text for enhanced expression
- `ShadowedReflexButton` – Stylish button with shadow and elevation

## 📦 Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  reflex_button: ^0.0.1
```

Then run:

```bash
flutter pub get
```

## 📸 Screenshots

*(Coming soon)*

## 🧩 Usage

```dart
import 'package:reflex_button/reflex_button.dart';
```

### Example: BounceReflexButton

```dart
BounceReflexButton(
  onPressed: () {
    print("Pressed!");
  },
  label: 'Bounce Button',
)
```

### Example: LoadingReflexButton

```dart
LoadingReflexButton(
  onPressed: () async {
    await Future.delayed(Duration(seconds: 2));
  },
  label: 'Submit',
)
```

### More Examples

See the full demo in the `example/` directory.

## 💡 Author

Created by [Hasan Surer](https://www.linkedin.com/in/hasan-surer-05208196/)

## 📃 License

MIT License
