# 🔥 Awesome Indicator

<table>
  <tr>
    <th>Horizontal</th>
    <th>Vertical</th>
  </tr>
  <tr>
     <td><img alt="" src="https://github.com/boglbbogl/awesome_indicator/assets/75574246/84f23b22-179a-4580-8997-891a60db33da" /></td>
    <td><img alt="" src="https://github.com/boglbbogl/awesome_indicator/assets/75574246/4d868eba-5bc2-40c1-bd1c-b2776516c8f2" /></td>
  <tr>
</table>

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

- Just provide your scroll view ```ScrollController``` to AwesomeHorizontalIndicator !

```dart
final ScrollController controller = ScrollController();

AwesomeHorizontalIndicator(
  controller: controller,
);
```

#### Optional

**_Size_**

- width : width of Indicator
- height : height of Indicator
- indicator : Indicator ratio between 0 and 1

```dart
AwesomeHorizontalIndicator(
  width : 300,
  height : 8,
  indicator : 0.3,
);
```

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
