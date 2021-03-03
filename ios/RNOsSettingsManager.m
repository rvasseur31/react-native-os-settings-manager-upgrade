#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(RNOsSettingsManager, NSObject)

RCT_EXTERN_METHOD(openAppSettings)

RCT_EXTERN_METHOD(areNotificationsEnabled: (RCTPromiseResolveBlock)resolve
                  rejecter: (RCTPromiseRejectBlock)reject)

RCT_EXTERN_METHOD(setNotificationBadge: (NSInteger *)notificationNumber)

@end
