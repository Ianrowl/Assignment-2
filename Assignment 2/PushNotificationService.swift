//
//  PushNotificationService.swift
//  Assignment 2
//
//  Created by Ian Rowland on 10/10/23.
//

import Foundation
import NotificationCenter

class PushNotificationService {
//class PushNotificationService: ObservableObject {
    var isPermissionGranted = false

    func requestPermissions() { //All code from Josh
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                self.isPermissionGranted = true
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }

    func scheduleNotification(title: String, subtitle: String) {
        let notificationContent = UNMutableNotificationContent()
        notificationContent.title = title
        notificationContent.subtitle = subtitle
        
        notificationContent.sound = UNNotificationSound(named: UNNotificationSoundName("dig-idea-40142.mp3"))

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

        let notificationRequest = UNNotificationRequest(identifier: UUID().uuidString, content: notificationContent, trigger: trigger)

        UNUserNotificationCenter.current().add(notificationRequest)
    }
    
    func clearNotifications() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
    }
}
