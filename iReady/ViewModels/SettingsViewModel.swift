//
//  SettingsViewModel.swift
//  iReady
//
//  Created by Krajg Larson on 2/25/24.
//
import SwiftUI

class SettingsViewModel: ObservableObject {
    @Published var workDuration: Double = 25
    @Published var studyDuration: Double = 30
    @Published var breakDuration: Double = 5
    @Published var notificationEnabled: Bool = true
    @Published var motivationalRemindersEnabled: Bool = false

    // Add logic to reset statistics
    func resetStatistics() {
        // Implement logic to reset statistics
    }
}
