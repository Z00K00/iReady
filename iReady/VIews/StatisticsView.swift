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
    @State private var totalWorkTime: TimeInterval = 5000 // Example: 5000 seconds
    @State private var totalBreakTime: TimeInterval = 2000 // Example: 2000 seconds
    @State private var completedSessions: Int = 10 // Example: 10 completed sessions

    // Sample data for productivity trends
    let productivityData: [Double] = [8, 23, 54, 32, 12, 37, 7, 23, 43] // Example data for productivity trends

    var body: some View {
        VStack {
            Text("Productivity Statistics")
                .font(.title)
                .padding()
            
            HStack(spacing: 20) {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Total Work Time")
                    Text("\(formattedTime(totalWorkTime))")
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color.gray.opacity(0.2))
                )
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Total Break Time")
                    Text("\(formattedTime(totalBreakTime))")
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color.gray.opacity(0.2))
                )
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Completed")
                    Text("Sessions \(completedSessions)")
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color.gray.opacity(0.2))
                )
            }
            .padding()
            
            // Line chart for productivity trends
            LineChart(chartData: createLineChartData())
                .frame(height: 300) // Adjust the height as needed
                .padding()
        }
        .onDisappear {
            // Save user data when the view disappears
            UserDataManager.shared.saveTotalWorkTime(totalWorkTime)
            UserDataManager.shared.saveTotalBreakTime(totalBreakTime)
            UserDataManager.shared.saveCompletedSessions(completedSessions)
            // No need to save productivityData as it's not modified in this view
        }
        .onAppear {
            // Load user data when the view appears
            totalWorkTime = UserDataManager.shared.getTotalWorkTime()
            totalBreakTime = UserDataManager.shared.getTotalBreakTime()
            completedSessions = UserDataManager.shared.getCompletedSessions()
            // No need to load productivityData as it's not modified in this view
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
            return LineChartDataPoint(value: value, xAxisLabel: "\(index)")
        }
        let dataSet = LineDataSet(dataPoints: dataPoints)
        return LineChartData(dataSets: dataSet)
    }
}


struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsView()
    }
}
