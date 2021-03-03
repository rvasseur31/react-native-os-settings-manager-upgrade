import UserNotifications

@objc(RNOsSettingsManager)
class RNOsSettingsManager: NSObject {
    
    @objc
    func openAppSettings() {
        UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!, options: [:], completionHandler: nil)
    }
    
    @objc
    func areNotificationsEnabled(_ resolve: @escaping RCTPromiseResolveBlock, rejecter reject: @escaping RCTPromiseRejectBlock) -> Void  {
        var dict: [AnyHashable : Bool] = [:]
        let center = UNUserNotificationCenter.current()
        center.getNotificationSettings(completionHandler: { permission in
            let notificationPermissionToCheck = ["badge": permission.badgeSetting, "alert": permission.alertSetting, "sound": permission.soundSetting]
            
            switch permission.authorizationStatus {
            case .authorized, .provisional:
                for (key, value) in notificationPermissionToCheck {
                    switch value {
                    case .enabled:
                        dict[key] = true
                        break
                    default:
                        break
                    }
                }
            default:
                break
            }
            resolve(dict)
        })
    }
}
