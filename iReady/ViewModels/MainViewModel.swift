//
//  MainViewModel.swift
//  iReady
//
//  Created by Krajg Larson on 2/25/24.
//

import Foundation
import Combine

class MainViewModel: ObservableObject {
    // Timer properties
    @Published var elapsedTime: TimeInterval = 0
    @Published var timerState: TimerState = .stopped
    @Published var pomodoroCount: Int = 0
    @Published var isWorkSession: Bool = true

    // Duration properties
    @Published var workDuration: TimeInterval = 25 * 60
    @Published var shortBreakDuration: TimeInterval = 5 * 60
    @Published var longBreakDuration: TimeInterval = 15 * 60
    @Published var customWorkDuration: Int = 25
    @Published var customShortBreakDuration: Int = 5
    @Published var customLongBreakDuration: Int = 15

    // Timer instance
    private var timer: Timer?

    init() {
        // Perform any additional setup here if needed
    }

    // Timer controls
    func startTimer() {
        // Implement timer start logic
    }

    func pauseTimer() {
        // Implement timer pause logic
    }

    func resetTimer() {
        // Implement timer reset logic
    }

    // Convenience method to format time interval as string
    func timeString(from time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }

    // Additional methods as needed
}
