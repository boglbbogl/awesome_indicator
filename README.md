<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

# Indicator that operates with horizontal scrolling

## Features

- Horizontal Scroll Indicator

-----------

## Support Platforms

- Flutter Android
- Flutter iOS
- Flutter Web
- Flutter Desktop

-----

## Usage

**_Add the package to pubspec.yaml_**

```
dependencies:
  awesome_indicator: ^<latest-version>
```

**_After that import the package_**

```
import 'package:awesome_indicator/awesome_indicator.dart';
```

### Scroll Indicator

```dart
final ScrollController controller = ScrollController();

AwesomeScrollIndicator(
  controller: controller,
);
```

**_Size_**

```dart
AwesomeScrollIndicator(
  width : 300,
  height : 8,
);
```

**_Colors_**

```dart
AwesomeScrollIndicator(
  backgroud: const Color.fromRGBO(95, 95, 95, 1),
  color : const Color.fromRGBO(255, 255, 255, 1),
);
```

### Optional



--------

Created by Tyger [Github](https://github.com/boglbbogl)
