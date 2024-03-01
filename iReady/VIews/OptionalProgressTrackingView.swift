//
//  OptionalProgressTrackingView.swift
//  iReady
//
//  Created by Krajg Larson on 2/25/24.
//

import SwiftUI

struct OptionalProgressTrackingView: View {
    @State private var selectedDate = Date()

    var body: some View {
        VStack {
            Text("Optional Progress Tracking View")
                .font(.title)
                .padding()

            CalendarView(selectedDate: $selectedDate)
                .padding()
        }
        .navigationTitle("Progress Tracking")
    }
}

struct OptionalProgressTrackingView_Previews: PreviewProvider {
    static var previews: some View {
        OptionalProgressTrackingView()
    }
}

struct CalendarView: View {
    @Binding var selectedDate: Date

    var body: some View {
        Calendar(
            currentMonth: selectedDate,
            selectedDate: $selectedDate,
            onDateSelected: { date in
                selectedDate = date
            }
        )
    }
}

struct Calendar: View {
    @State private var currentMonth: Date
    @Binding var selectedDate: Date
    var onDateSelected: (Date) -> Void

    init(currentMonth: Date, selectedDate: Binding<Date>, onDateSelected: @escaping (Date) -> Void) {
        self._currentMonth = State(initialValue: currentMonth)
        self._selectedDate = selectedDate
        self.onDateSelected = onDateSelected
    }

    var body: some View {
        VStack {
            Text("\(currentMonth, formatter: dateFormatter)")
                .font(.title)

            Divider()

            // Your calendar implementation here
            // For simplicity, you can use a library or create your own calendar view
            // Implement a calendar view showing completed sessions and tasks
            // You can use any available calendar libraries or create a custom calendar view
            // For demo purposes, you can display the selected date
            Text("Selected Date: \(selectedDate, formatter: dateFormatter)")
                .padding()
        }
    }

    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        return formatter
    }
}
