//
//  ContentView.swift
//  iReady
//
//  Created by Krajg Larson on 2/25/24.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    var body: some View {
        NavigationView {
            MotivationalReminderView()
        }
    }
}

struct MotivationalReminderView: View {
    @AppStorage("notificationEnabled") private var notificationEnabled = false
    @AppStorage("notificationTime") private var notificationTime = Date()
    
    var body: some View {
        VStack {
            Toggle("Enable Notifications", isOn: $notificationEnabled)
                .padding()
            
            if notificationEnabled {
                DatePicker("Notification Time", selection: $notificationTime, displayedComponents: .hourAndMinute)
                    .padding()
            }
            
            Button("Save Settings") {
                saveSettings()
            }
            .padding()
        }
        .navigationTitle("Motivational Reminders")
    }
    
    private func saveSettings() {
        if notificationEnabled {
            scheduleDailyNotification()
        } else {
            cancelNotifications()
        }
    }
    
    private func scheduleDailyNotification() {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound]) { granted, error in
            if let error = error {
                print("Error requesting notification authorization: \(error.localizedDescription)")
            } else if granted {
                let content = UNMutableNotificationContent()
                content.title = "Motivational Reminder"
                content.body = "Your daily motivational quote awaits!"
                content.sound = UNNotificationSound.default
                
                let trigger = UNCalendarNotificationTrigger(dateMatching: Calendar.current.dateComponents([.hour, .minute], from: notificationTime), repeats: true)
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                
                center.add(request)
            }
        }
    }
    
    private func cancelNotifications() {
        let center = UNUserNotificationCenter.current()
        center.removeAllPendingNotificationRequests()
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
