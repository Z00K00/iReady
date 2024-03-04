//
//  StatisticsViewModel.swift
//  iReady
//
//  Created by Krajg Larson on 2/25/24.
//

import SwiftUI
import SwiftUICharts

class StatisticsViewModel: ObservableObject {
    @Published var totalWorkTime: TimeInterval = 5000
    @Published var totalBreakTime: TimeInterval = 2000
    @Published var completedSessions: Int = 10
    let productivityData: [Double] = [8, 23, 54, 32, 12, 37, 7, 23, 43]

    init() {
        loadUserData()
    }

    private func loadUserData() {
        totalWorkTime = UserDataManager.shared.getTotalWorkTime()
        totalBreakTime = UserDataManager.shared.getTotalBreakTime()
        completedSessions = UserDataManager.shared.getCompletedSessions()
    }

    func saveUserData() {
        UserDataManager.shared.saveTotalWorkTime(totalWorkTime)
        UserDataManager.shared.saveTotalBreakTime(totalBreakTime)
        UserDataManager.shared.saveCompletedSessions(completedSessions)
    }

    func formattedTime(_ timeInterval: TimeInterval) -> String {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .positional
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.zeroFormattingBehavior = .pad
        return formatter.string(from: timeInterval) ?? ""
    }

    func createLineChartData() -> LineChartData {
            let dataPoints = productivityData.enumerated().map { (index, value) in
                return LineChartDataPoint(value: value, xAxisLabel: "\(index)")
            }
            let dataSet = LineDataSet(dataPoints: dataPoints)
            return LineChartData(dataSets: dataSet)
    }
}
