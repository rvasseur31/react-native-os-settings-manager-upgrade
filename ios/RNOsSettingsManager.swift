import UserNotifications

@objc(RNOsSettingsManager)
class RNOsSettingsManager: NSObject {
    
    @objc
    static func requiresMainQueueSetup() -> Bool {
        return true
    }
    
    @objc
    func openAppSettings() {
        DispatchQueue.main.async {
            UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!, options: [:], completionHandler: nil)
        }
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
    
    @objc
    func setNotificationBadge(_ notificationNumber: Int) -> Void  {
        let application = UIApplication.shared
        if #available(iOS 10.0, *) {
            let center = UNUserNotificationCenter.current()
            center.requestAuthorization(options: [.badge, .alert, .sound]) { _, _ in }
        } else {
            application.registerUserNotificationSettings(UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil))
        }
        DispatchQueue.main.async {
            application.registerForRemoteNotifications()
            application.applicationIconBadgeNumber = notificationNumber
        }
    }
}
