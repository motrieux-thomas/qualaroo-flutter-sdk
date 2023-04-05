
# qualaroo-flutter
Flutter Bridge for Qualaroo Mobile SDK

## Getting started

### 1. Add Depencency
Add dependency in pubspec.yml
```
qualaroo_flutter: 0.0.1
  ```

### 2. Install It
You can install packages from the command line:
```
flutter pub get
  ```

#### For iOS specific
- make sure your `ios/Podfile` contains:
```
target 'Runner' do
...
  use_frameworks!
  pod 'Qualaroo', :git => 'https://github.com/qualaroo/ios-sdk.git', :tag => '1.14.8'
 ...
end
```
- navigate to **ios** directory and run `pod install`

## Usage
```javascript
import 'package:qualaroo_flutter/qualaroo_flutter.dart';

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
