#import "QualarooFlutterPlugin.h"
@import Qualaroo;

@implementation QualarooFlutterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"qualaroo_flutter_sdk"
            binaryMessenger:[registrar messenger]];
  QualarooFlutterPlugin* instance = [[QualarooFlutterPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  } else if([@"initializeQualarooSdk" isEqualToString:call.method]){
      NSString *apiKey = call.arguments;
        [Qualaroo.shared configureWithApiKey:apiKey autotracking:false];
      
  } else if([@"showSurvey" isEqualToString:call.method]){
      NSString *alias = call.arguments;
       [Qualaroo.shared showSurveyWith:alias on:nil forced:false delegate:nil];
  }
   else if([@"setUserId" isEqualToString:call.method]){
       NSString *userId = call.arguments;
        [Qualaroo.shared setUserID:userId];
   }
   else if([@"setUserProperty" isEqualToString:call.method]){
       NSString *key = [call.arguments objectForKey:@"key"];
         NSString *property = [call.arguments objectForKey:@"value"];
         [Qualaroo.shared addUserProperty:key withValue:property];
   }
   else if([@"removeProperty" isEqualToString:call.method]){
       NSString *propertyKey = call.arguments;
        [Qualaroo.shared removeUserProperty:propertyKey];
   }
   else if([@"setPrefferedLanguage" isEqualToString:call.method]){
       NSString *language = call.arguments;
       [Qualaroo.shared setPreferredSurveysLanguage:language error:nil];
   }
  else {
    result(FlutterMethodNotImplemented);
  }
}

@end
