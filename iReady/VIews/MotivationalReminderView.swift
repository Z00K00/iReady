//
//  MotivationalReminderView.swift
//  iReady
//
//  Created by Krajg Larson on 2/25/24.
//

import SwiftUI
import UserNotifications

struct MotivationalRemindersView: View {
    @State private var reminders: [String] = [] // Array to store motivational reminders
    @State private var newReminder: String = "" // New reminder to be added
    @State private var notificationEnabled: Bool = false // Flag to enable/disable notifications
    @State private var notificationTime: Date = Date() // Time for the daily notification

    var body: some View {
        VStack {
            List {
                ForEach(reminders, id: \.self) { reminder in
                    Text(reminder)
                }
                .onDelete(perform: deleteReminder)
            }
            .listStyle(InsetGroupedListStyle())

            HStack {
                TextField("Enter a new reminder", text: $newReminder)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                Button(action: addReminder) {
                    Text("Add")
                }
            }
            .padding()

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
        .onAppear {
            loadSettings()
        }
    }

    // Function to add a new reminder
    private func addReminder() {
        if !newReminder.isEmpty {
            reminders.append(newReminder)
            newReminder = ""
        }
    }

    // Function to delete a reminder
    private func deleteReminder(at offsets: IndexSet) {
        reminders.remove(atOffsets: offsets)
    }

    // Function to save notification settings
    private func saveSettings() {
        // Save notification settings
        if notificationEnabled {
            scheduleDailyNotification()
        } else {
            cancelNotifications()
        }
    }

    // Function to load notification settings
    private func loadSettings() {
        // Load notification settings
        // For demonstration, set default time to 8 AM
        let calendar = Foundation.Calendar.current
        let defaultNotificationTime = calendar.date(bySettingHour: 8, minute: 0, second: 0, of: Date())
        notificationTime = defaultNotificationTime ?? Date()
    }

    // Function to schedule a daily notification
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

                var dateComponents = Foundation.Calendar.current.dateComponents([.hour, .minute], from: notificationTime)
                dateComponents.weekday = 1 // Set to any day for weekly reminder

                let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

                center.add(request)
            }
        }
    }

    // Function to cancel all notifications
    private func cancelNotifications() {
        let center = UNUserNotificationCenter.current()
        center.removeAllPendingNotificationRequests()
    }
}

struct MotivationalRemindersView_Previews: PreviewProvider {
    static var previews: some View {
        MotivationalRemindersView()
    }
}
