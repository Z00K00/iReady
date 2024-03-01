//
//  StatisticsView.swift
//  iReady
//
//  Created by Krajg Larson on 2/25/24.
//

import SwiftUI
import SwiftUICharts // Import SwiftUICharts library

struct StatisticsView: View {
    // Sample data for demonstration
    let totalWorkTime: TimeInterval = 5000 // Example: 5000 seconds
    let totalBreakTime: TimeInterval = 2000 // Example: 2000 seconds
    let completedSessions: Int = 10 // Example: 10 completed sessions

    // Sample data for productivity trends
    let productivityData: [Double] = [8, 23, 54, 32, 12, 37, 7, 23, 43] // Example data for productivity trends

    var body: some View {
        VStack {
            Text("Productivity Statistics")
                .font(.title)
                .padding()
            
            HStack {
                VStack {
                    Text("Total Work Time")
                    Text("\(formattedTime(totalWorkTime))")
                }
                .padding()
                
                VStack {
                    Text("Total Break Time")
                    Text("\(formattedTime(totalBreakTime))")
                }
                .padding()
                
                VStack {
                    Text("Completed Sessions")
                    Text("\(completedSessions)")
                }
                .padding()
            }
            
            // Line chart for productivity trends
            LineChart(chartData: createLineChartData())
                .padding()
        }
    }
    
    // Utility function to format time interval as string (HH:mm:ss)
    private func formattedTime(_ timeInterval: TimeInterval) -> String {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .positional
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.zeroFormattingBehavior = .pad
        return formatter.string(from: timeInterval)!
    }

    // Create LineChartData from productivityData
    private func createLineChartData() -> LineChartData {
        let dataPoints = productivityData.enumerated().map { (index, value) in
            return ChartDataPoint(value: value, xAxisLabel: "\(index)")
        }
        return LineChartData(dataPoints: dataPoints, legendTitle: "Productivity Trends", metadata: "Daily")
    }
}

struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsView()
    }
}
