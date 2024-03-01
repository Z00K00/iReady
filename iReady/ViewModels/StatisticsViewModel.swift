//
//  StatisticsViewModel.swift
//  iReady
//
//  Created by Krajg Larson on 2/25/24.
//

import SwiftUI
import SwiftUICharts

class StatisticsViewModel: ObservableObject {
    // Sample data for demonstration
    let totalWorkTime: TimeInterval = 5000 // Example: 5000 seconds
    let totalBreakTime: TimeInterval = 2000 // Example: 2000 seconds
    let completedSessions: Int = 10 // Example: 10 completed sessions

    // Sample data for productivity trends
    let productivityData: [Double] = [8, 23, 54, 32, 12, 37, 7, 23, 43] // Example data for productivity trends

    // Utility function to format time interval as string (HH:mm:ss)
    func formattedTime(_ timeInterval: TimeInterval) -> String {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .positional
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.zeroFormattingBehavior = .pad
        return formatter.string(from: timeInterval)!
    }

    // Create LineChartData from productivityData
    func createLineChartData() -> LineChartData {
        let dataPoints = productivityData.enumerated().map { (index, value) in
            return ChartDataPoint(value: value, xAxisLabel: "\(index)")
        }
        return LineChartData(dataPoints: dataPoints, legendTitle: "Productivity Trends", metadata: "Daily")
    }
}
