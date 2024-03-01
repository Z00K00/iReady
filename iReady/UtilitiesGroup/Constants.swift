//
//  Constants.swift
//  iReady
//
//  Created by Krajg Larson on 2/25/24.
//

import Foundation


struct Constants {
    struct TimerDurations {
        static let workDuration: TimeInterval = 25 * 60 // 25 minutes in seconds
        static let studyDuration: TimeInterval = 30 * 60 // 30 minutes in seconds
        static let breakDuration: TimeInterval = 5 * 60 // 5 minutes in seconds
    }
    
    struct NotificationIdentifiers {
        static let sessionStart = "com.yourcompany.app.sessionStart"
        static let sessionEnd = "com.yourcompany.app.sessionEnd"
    }
    
    // Add more constants as needed
}
