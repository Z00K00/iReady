//
//  SettingsView.swift
//  iReady
//
//  Created by Krajg Larson on 2/25/24.
//

import SwiftUI

struct SettingsView: View {
    @State private var workDuration: Double = 25
    @State private var studyDuration: Double = 30
    @State private var breakDuration: Double = 5
    @State private var notificationEnabled: Bool = true
    @State private var motivationalRemindersEnabled: Bool = false

    var body: some View {
        VStack {
            Form {
                Section(header: Text("Timer Durations")) {
                    Slider(value: $workDuration, in: 5...60, step: 5, label: {
                        Text("Work Duration: \(Int(workDuration)) minutes")
                    })
                    Slider(value: $studyDuration, in: 5...60, step: 5, label: {
                        Text("Study Duration: \(Int(studyDuration)) minutes")
                    })
                    Slider(value: $breakDuration, in: 1...15, step: 1, label: {
                        Text("Break Duration: \(Int(breakDuration)) minutes")
                    })
                }

                Section(header: Text("Notification Preferences")) {
                    Toggle("Enable Notifications", isOn: $notificationEnabled)
                    Toggle("Enable Motivational Reminders", isOn: $motivationalRemindersEnabled)
                }

                Section(header: Text("App Settings")) {
                    Button("Reset Statistics") {
                        // Implement logic to reset statistics
                    }
                }
            }
            .navigationTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
