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

**__**

**_Colors_**

- background : backround color of Indicator
- color : Indicator color

```dart
AwesomeHorizontalIndicator(
  backgroud: const Color.fromRGBO(95, 95, 95, 1),
  color : const Color.fromRGBO(255, 255, 255, 1),
);
```

**_Box_**

- border : Boder of Container
- radius : BorderRadius of Container

```dart
AwesomeHorizontalIndicator(
  border : Border.all(),
  radius : 20,
);
```

**_onListener_**

```dart
AwesomeHorizontalIndicator(
  onListener: (int ratio, double position) {},
);
```

## Attribute

| Attribute      | Type     | Required  | Description                 | Default Value                 |
| -------------- | --------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------ | ------------------------ |
| controller     | ScrollController      | O  | Scroll listener.                  | -               | 
| height         | double                | X  | Total height.                     | 8.0             | 
| width          | double                | X  | Total width.                      | Max width       | 
| indicator      | double                | X  | Indicator weight.                 | 50%             | 
| background     | Color                 | X  | Background Color.                 | Hex(#C3C3C3)    | 
| color          | Color                 | X  | Indicator Color.                  | Hex(#000000)    | 
| radius         | double                | X  | Container Radius.                 | Max width       | 
| border         | Border                | X  | Container Border.                 | Border.none     | 
| onListener     | Function(int, double) | X  | Listen state(Percentage, Pixel).  | -               | 






--------

Created by Tyger [Github](https://github.com/boglbbogl)
