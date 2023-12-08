# 🔥 Awesome Indicator

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

- ScrollView 위젯의 Controller를 전달만 하시면 되요 !

```dart
final ScrollController controller = ScrollController();

AwesomeScrollIndicator(
  controller: controller,
);
```

#### Optional

**_Size_**

- width : Indicator 가로 사이즈를 지정할 수 있어요 !
- height : Indicator 높이 사이즈를 지정할 수 있어요 !
- indicator : Indicator의 비율을 0~1 사이의 비율로 지정해 주세요 !

```dart
AwesomeScrollIndicator(
  width : 300,
  height : 8,
  indicator : 0.3,
);
```

**_Colors_**

- background : Indicator 백그라운드 컬러를 지정해 주세요 !
- color : Indicator 컬러를 지정해 주세요 !

```dart
AwesomeScrollIndicator(
  backgroud: const Color.fromRGBO(95, 95, 95, 1),
  color : const Color.fromRGBO(255, 255, 255, 1),
);
```

**_Box_**

- border : Container의 Boder를 생성할 수 있어요 !
- radius : BorderRadius 값을 생성할 수 있어요 !

```dart
AwesomeScrollIndicator(
  border : Border.all(),
  radius : 20,
);
```

**_onListener_**

- onListener : Indicator 수신을 리턴 받을 수 있어요 !

```dart
AwesomeScrollIndicator(
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
