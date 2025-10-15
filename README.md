
# Qualaroo Flutter SDK
A Flutter bridge for integrating Qualaroo mobile SDK to your mobile application.

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  qualaroo_flutter_sdk: ^0.0.3
```

Then run:
```bash
flutter pub get
```

## Getting Started

### 1. Setup SDK
Import Qualaroo Flutter SDK:
```
import 'package:qualaroo_flutter_sdk/qualaroo_flutter.dart';
  ```

#### For iOS
- Make sure your ios/Podfile contains:
```
target 'Runner' do
...
  use_frameworks!
  pod 'Qualaroo', :git => 'https://github.com/qualaroo/ios-sdk.git', :tag => '1.14.9'
 ...
end
```
- Navigate to **ios** directory and run `pod install`

## Usage
```javascript
import 'package:qualaroo_flutter_sdk/qualaroo_flutter.dart';

final _qualarooFlutterPlugin = QualarooFlutter();

//In order to be able to use Qualaroo SDK you need to to initialize it first.
_qualarooFlutterPlugin.initializeQualarooSdk("<your_api_key">)

//Display survey with a given alias:
_qualarooFlutterPlugin.showSurvey("survey_alias")

//Set unique user id
_qualarooFlutterPlugin.setUserId("HAL_9000");

//Set user property "name" to "Hal"
_qualarooFlutterPlugin.setUserProperty("name", "Hal");

//remove property "name"
_qualarooFlutterPlugin.removeUserProperty("name");

//You can set preferred language that you want to use when displaying surveys.
_qualarooFlutterPlugin.setPreferredLanguage("fr")

```
