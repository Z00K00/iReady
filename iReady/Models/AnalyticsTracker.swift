//
//  AnalyticsTracker.swift
//  iReady
//
//  Created by Krajg Larson on 3/13/24.
//

import Foundation

class AnalyticsTracker: ObservableObject {
    static let shared = AnalyticsTracker()
    
    // All Time Analytics
    @Published private(set) var totalWorkTime = UserDefaults.standard.integer(forKey: "totalWorkTime") {
        didSet {
            UserDefaults.standard.setValue(totalWorkTime, forKey: "totalWorkTime")
        }
    }
    @Published private(set) var totalBreakTime = UserDefaults.standard.integer(forKey: "totalBreakTime") {
        didSet {
            UserDefaults.standard.setValue(totalBreakTime, forKey: "totalBreakTime")
        }
    }
    @Published private(set) var totalSessions = UserDefaults.standard.integer(forKey: "totalSessions") {
        didSet {
            UserDefaults.standard.setValue(totalSessions, forKey: "totalSessions")
        }
    }
    
    func addWorkTime(_ seconds: Int) {
        totalWorkTime += seconds
    }
    
    func addBreakTime(_ seconds: Int) {
        totalBreakTime += seconds
    }
    
    func addSession() {
        totalSessions += 1
    }
    
    func resetData() {
        totalWorkTime = 0
        totalBreakTime = 0
        totalSessions = 0
    }
}
