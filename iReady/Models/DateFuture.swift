//
//  DateFuture.swift
//  iReady
//
//  Created by Krajg Larson on 3/1/24.
//

import Foundation

extension Date {
    func byAdding(days: Int) -> Date {
        var dateComponents = DateComponents()
        dateComponents.day = days

        return Foundation.Calendar.current.date(byAdding: dateComponents, to: self) ?? self
    }
}
