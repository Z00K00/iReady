//
//  ContentView.swift
//  iReady
//
//  Created by Krajg Larson on 2/25/24.
//

import SwiftUI
import UserNotifications


struct YourAppNameApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Spacer()

                Image("iReady-2")
                    .resizable()
                    .aspectRatio(contentMode: .fill) // Change contentMode to fill
                    .frame(width: 250, height: 250)
                    .clipShape(Circle())
                    .shadow(radius: 10)
                    .padding() // Add padding to main

                Text("Welcome to iReady")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 20)
                    
                Text("Empower Your Productivity with iReady:\nTime Management, Tasks, Motivation, and Insights, \nAll in One Place!")
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
                    .padding(.bottom, 20)
                    
                NavigationLink(destination: MainMenu()) {
                    Text("Get Started")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding(.horizontal, 20)
                }
                .padding(.bottom, 40)

                Spacer()
            }
            .navigationBarHidden(true)
        }
    }
}
              
struct MotivationalReminderView: View {
    @AppStorage("notificationEnabled") private var notificationEnabled: Bool = false
    @State private var notificationTime: Date = Date() // Separate state for notification time

    // Temporary variable to hold DatePicker value
    @State private var selectedTime: Date = Date()

    var body: some View {
        VStack {
            Toggle("Enable Notifications", isOn: $notificationEnabled)
                .padding()

            if notificationEnabled {
                DatePicker("Notification Time", selection: $selectedTime, displayedComponents: .hourAndMinute)
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
        // Update notificationTime with selectedTime when saving settings
        notificationTime = selectedTime

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

                var dateComponents = Foundation.Calendar.current.dateComponents([.hour, .minute], from: notificationTime)
                dateComponents.weekday = 1 // Set to any day for weekly reminder

                if let notificationDate = Foundation.Calendar.current.date(from: dateComponents), notificationDate > Date() {
                    let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
                    let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                    center.add(request)
                } else {
                    print("Selected time is in the past. Please select a future time for notification.")
                }
            }
        }
    }

    private func cancelNotifications() {
        let center = UNUserNotificationCenter.current()
        center.removeAllPendingNotificationRequests()
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
