//
//  UserData.swift
//  iReady
//
//  Created by Krajg Larson on 3/4/24.
//

import Foundation

class UserDataManager {
    static let shared = UserDataManager()
    
    private let totalWorkTimeKey = "TotalWorkTime"
    private let totalBreakTimeKey = "TotalBreakTime"
    private let completedSessionsKey = "CompletedSessions"
    
    private init() {}
    
    // Save total work time
    func saveTotalWorkTime(_ time: TimeInterval) {
        UserDefaults.standard.set(time, forKey: totalWorkTimeKey)
    }
    
    // Save total break time
    func saveTotalBreakTime(_ time: TimeInterval) {
        UserDefaults.standard.set(time, forKey: totalBreakTimeKey)
    }
    
    // Save completed sessions
    func saveCompletedSessions(_ sessions: Int) {
        UserDefaults.standard.set(sessions, forKey: completedSessionsKey)
    }
    
    // Retrieve total work time
    func getTotalWorkTime() -> TimeInterval {
        return UserDefaults.standard.double(forKey: totalWorkTimeKey)
    }
    
    // Retrieve total break time
    func getTotalBreakTime() -> TimeInterval {
        return UserDefaults.standard.double(forKey: totalBreakTimeKey)
    }
    
    // Retrieve completed sessions
    func getCompletedSessions() -> Int {
        return UserDefaults.standard.integer(forKey: completedSessionsKey)
    }
    
    // Reset all user data
    func resetUserData() {
        UserDefaults.standard.removeObject(forKey: totalWorkTimeKey)
        UserDefaults.standard.removeObject(forKey: totalBreakTimeKey)
        UserDefaults.standard.removeObject(forKey: completedSessionsKey)
    }
}
