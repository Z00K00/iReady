//
//  SettingsView.swift
//  iReady
//
//  Created by Krajg Larson on 2/25/24.
//

import SwiftUI

struct SettingsView: View {
    // Define your statistics variables here
    @State private var totalWorkTime: TimeInterval = 0
    @State private var totalBreakTime: TimeInterval = 0
    @State private var completedSessions: Int = 0
    @State private var productivityData: [Double] = []

    var body: some View {
        VStack {
            Form {
                Section(header: Text("App Settings")) {
                    Button("Reset Statistics") {
                        // Call the function to reset statistics
                        resetStatistics()
                    }
                }
            }
            .navigationTitle("Settings")
        }
        .onDisappear {
            // Save user data when the view disappears
            UserDataManager.shared.saveTotalWorkTime(totalWorkTime)
            UserDataManager.shared.saveTotalBreakTime(totalBreakTime)
            UserDataManager.shared.saveCompletedSessions(completedSessions)
            // No need to save productivityData as it's not modified in this view
        }
        .onAppear {
            // Load user data when the view appears
            totalWorkTime = UserDataManager.shared.getTotalWorkTime()
            totalBreakTime = UserDataManager.shared.getTotalBreakTime()
            completedSessions = UserDataManager.shared.getCompletedSessions()
            // No need to load productivityData as it's not modified in this view
        }
    }
    
    // Function to reset statistics
    private func resetStatistics() {
        // Reset all your statistics variables to their initial values
        totalWorkTime = 0
        totalBreakTime = 0
        completedSessions = 0
        productivityData = []
    }
}
