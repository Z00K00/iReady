//
//  MotivationalReminder.swift
//  iReady
//
//  Created by Krajg Larson on 2/25/24.
//

import Foundation


struct MotivationalReminder {
    var id: UUID
    var message: String
    var frequency: Frequency
    var isEnabled: Bool
}

enum Frequency {
    case daily
    case weekly
    case custom(interval: TimeInterval)
}
