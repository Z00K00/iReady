//
//  Task.swift
//  iReady
//
//  Created by Krajg Larson on 2/25/24.
//

import Foundation


struct Task {
    let name: String
    let description: String
    var dueDate: Date?
    var priority: Priority
    var isCompleted: Bool
}

enum Priority {
    case low, medium, high
}
