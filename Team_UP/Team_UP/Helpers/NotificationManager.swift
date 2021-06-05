//
//  NotificationManager.swift
//  Team_UP
//
//  Created by Dmitry Kulagin on 05.06.2021.
//

import UIKit
import UserNotifications

class NotificationManager {
    
    static let shared = NotificationManager()
    
    private let center: UNUserNotificationCenter
    
    init() {
        self.center = UNUserNotificationCenter.current()
    }
    
    func registerForPushNotification() {
        
        let action = UNNotificationAction(
            identifier: "event.action.category",
            title: "Подробнее",
            options: [])
        
        let category = UNNotificationCategory(
            identifier: "event.category",
            actions: [action],
            intentIdentifiers: [],
            options: [])
        
        center.setNotificationCategories([category])
        
        let options: UNAuthorizationOptions = [.alert, .sound]
        center.requestAuthorization(options: options) { (granted, error) in
            if !granted {
                print("access non granted")
            }
            self.center.getNotificationSettings { (settings) in
                if settings.authorizationStatus != .authorized {
                    // Notifications not allowed
                    let alert = UIAlertController(title: "Allow notification Access",
                                                  message: "Allow notification access in your device settings.",
                                                  preferredStyle: UIAlertController.Style.alert)
                    
                    // Button to Open Settings
                    alert.addAction(UIAlertAction(title: "Settings",
                                                  style: UIAlertAction.Style.default,
                                                  handler: { action in
                                                    guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
                                                        return
                                                    }
                                                    if UIApplication.shared.canOpenURL(settingsUrl) {
                                                        UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
                                                            print("Settings opened: \(success)")
                                                        })
                                                    }
                                                  }))
                    alert.addAction(UIAlertAction(title: "Close", style: UIAlertAction.Style.default, handler: nil))
                    
                    DispatchQueue.main.async {
                        if let app = UIApplication.shared.delegate as? AppDelegate {
                            app.window?.rootViewController?.present(alert, animated: true)
                        }
                    }
                }
            }
            if error == nil {
                DispatchQueue.main.async {
                    UIApplication.shared.registerForRemoteNotifications()
                }
            }
        }
    }
    
    func showNotification(title: String,
                          body: String,
                          identifier: String,
                          category: String? = nil) {
        
        center.getNotificationSettings { settings in
            if settings.authorizationStatus == .authorized {
                
                let content = UNMutableNotificationContent()
                content.title = title
                content.body = body
                content.sound = UNNotificationSound.default
                if let category = category {
                    content.categoryIdentifier = category
                }
                
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
                let request = UNNotificationRequest(identifier: identifier,
                                                    content: content,
                                                    trigger: trigger)
                self.center.add(request, withCompletionHandler: { error in
                    if let error = error {
                        print(error.localizedDescription)
                    }
                })
            }
        }
    }
}
