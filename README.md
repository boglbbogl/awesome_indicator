# 🔥 Awesome Indicator

<table>
  <tr>
    <th>Horizontal</th>
    <th>Vertical</th>
  </tr>
  <tr>
     <td><img alt="" src="https://github.com/boglbbogl/awesome_indicator/assets/75574246/302ef760-885b-4025-a35c-780e12dab8d3" /></td>
    <td><img alt="" src="https://github.com/boglbbogl/awesome_indicator/assets/75574246/06142a1d-4434-4bdf-8c15-e02a286e3950" /></td>
  <tr>
</table>

## Features

- AwesomeIndicator.move
- AwesomeIndicator.fill

-----------

## Support Platforms

- Flutter Android
- Flutter iOS
- Flutter Web
- Flutter Desktop

-----

## Usage

**_Add the package to pubspec.yaml_**

```yaml
dependencies:
  awesome_indicator: ^<latest-version>
```

**_After that import the package_**

```dart
import 'package:awesome_indicator/awesome_indicator.dart';
```

### AwesomeIndicator

#### .move

```dart
AwesomeIndicator.move(
  controller: _controller,
);
```

#### .fill

```dart
AwesomeIndicator.fill(
  controller: _controller,
);
```

#### Require

**_controller_**

```dart
AwesomeIndicator.type(
  controller: ScrollController(),
);
```

#### Optional

**_scrollDirection_**
> Default: Axis.horizontal

```dart
AwesomeIndicator.type(
  scrollDirection: Axis.horizontal,
);
```

**_width_**
> Axis.horizontal : maxWidth

> Axis.vertical : 8

```dart
AwesomeIndicator.type(
  width: _width,
);
```

**_height_**
> Axis.horizontal : 8

> Axis.vertical : maxHeight

```dart
AwesomeIndicator.type(
  height: _height,
);
```

**_indicator_**
> only .move mode

> Default: 0.35 
- Indicator ratio between 0 and 1

```dart
AwesomeIndicator.type(
  indicator: 0.35,
);
```

**_color_**
- Indicator Color

```dart
AwesomeIndicator.type(
  color: _color,
);
```

**_background_**
- Backround color of Indicator

```dart
AwesomeIndicator.type(
  background: _background,
);
```

**_gradient_**

```dart
AwesomeIndicator.type(
  gradient: _gradient,
);
```

**_backgroundGradient_**

```dart
AwesomeIndicator.type(
  backgroundGradient: _backgroundGradient,
);
```

**_radius_**
> Default: 8

```dart
AwesomeIndicator.type(
  radius: 8,
);
```

**_margin_**

```dart
AwesomeIndicator.type(
  margin: const EdgeInsets.zero,
);
```

**_onListener_**

```dart
AwesomeIndicator.type(
  onListener: (int ratio, double pixel, Axis direction) {
      // indicator Ratio
      // indicator Pixel
      // ScrollDirection
  },
);
```

**_isDebug_**
> Default: true

> Console log

```dart
AwesomeIndicator.type(
  isDebug: true,
);
```


--------

Created by Tyger [Github](https://github.com/boglbbogl)
