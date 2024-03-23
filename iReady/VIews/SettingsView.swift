//
//  SettingsView.swift
//  iReady
//
//  Created by Krajg Larson on 2/25/24.
//

import SwiftUI

struct SettingsView: View {
    // Define your statistics variables here
    @ObservedObject var analyticsTracker = AnalyticsTracker.shared

    var body: some View {
        VStack {
            Form {
                Section(header: Text("App Settings")) {
                    Button("Reset Statistics") {
                        // Call the function to reset statistics
                        analyticsTracker.resetData()
                    }
                }
            }
            .navigationTitle("Settings")
        }
    }
}
