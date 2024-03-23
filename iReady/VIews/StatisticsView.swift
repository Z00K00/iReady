//
//  StatisticsView.swift
//  iReady
//
//  Created by Krajg Larson on 2/25/24.
//

import SwiftUI
import SwiftUICharts // Import SwiftUICharts library

struct StatisticsView: View {
    // Grid Columns
    let columns = Array(repeating: GridItem(), count: 3)
    @ObservedObject var analyticsTracker = AnalyticsTracker.shared
    @State var isShowingResetAlert = false
    
    var body: some View {
        VStack {
            HStack(spacing: 20) {
                Text("Work Time\n\(formattedTime(analyticsTracker.totalWorkTime))")
                    .minimumScaleFactor(0.6)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                .frame(height: 50)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color.gray.opacity(0.2))
                )
                
                Text("Break Time\n\(formattedTime(analyticsTracker.totalBreakTime))")
                    .minimumScaleFactor(0.6)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                .frame(height: 50)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color.gray.opacity(0.2))
                )
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Sessions\n \(analyticsTracker.totalSessions)")
                        .minimumScaleFactor(0.6)
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                }
                .frame(height: 50)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color.gray.opacity(0.2))
                )
            }
            .padding()
            
            // Badges
            ScrollView {
                LazyVGrid(columns: columns, content: {
                    ForEach(0..<25) { _ in
                        Image(systemName: "seal")
                            .resizable()
                            .scaledToFit()
                            .padding()
                    }
                })
            }
            .padding(.horizontal)
            .foregroundStyle(.gray)
            .disabled(true)
            .opacity(0.6)
            .overlay {
                Text("Coming Soon") // Coming soon tag for badges
                    .foregroundStyle(.white)
                    .font(.title)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 12)
                        .opacity(0.96))
            }
            
        }
        .navigationTitle(Text("Productivity Statistics"))
        .navigationBarTitleDisplayMode(.large)
        .toolbar(content: {
            Button("Reset") {
                // Call the function to reset statistics
                isShowingResetAlert.toggle()
            }
            .foregroundStyle(.red)
        })
        .alert("Are You Sure?", isPresented: $isShowingResetAlert) {
            Button("Reset", role: .destructive) {
                analyticsTracker.resetData()
            }
        } message: {
            Text("Resetting your statistics is a permanant action that cannot be undone.")
        }
    }
    
    // Utility function to format time interval as string (HH:mm:ss)
    private func formattedTime(_ timeInterval: Int) -> String {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .positional
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.zeroFormattingBehavior = .pad
        return formatter.string(from: TimeInterval(timeInterval))!
    }
}


struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsView()
    }
}
