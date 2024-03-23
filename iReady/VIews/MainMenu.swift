//
//  MainMenu.swift
//  iReady
//
//  Created by Krajg Larson on 3/4/24.
//

import SwiftUI

struct MainMenu: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: MainView()) {
                    HStack {
                        Image(systemName: "timer")
                            .foregroundColor(.blue)
                            .frame(width: 30, height: 30)
                        Text("Pomodoro Timer")
                    }
                }

                NavigationLink(destination: TaskListView()) {
                    HStack {
                        Image(systemName: "list.bullet")
                            .foregroundColor(.green)
                            .frame(width: 30, height: 30)
                        Text("Task List")
                    }
                }

                NavigationLink(destination: StatisticsView()) {
                    HStack {
                        Image(systemName: "chart.bar")
                            .foregroundColor(.orange)
                            .frame(width: 30, height: 30)
                        Text("Statistics")
                    }
                }

//                NavigationLink(destination: SettingsView()) {
//                    HStack {
//                        Image(systemName: "gear")
//                            .foregroundColor(.purple)
//                            .frame(width: 30, height: 30)
//                        Text("Settings")
//                    }
//                }

//                NavigationLink(destination: MotivationalReminderView()) {
//                    HStack {
//                        Image(systemName: "quote.bubble")
//                            .foregroundColor(.pink)
//                            .frame(width: 30, height: 30)
//                        Text("Motivational Reminder")
//                    }
//                }
            }
            .navigationTitle("iReady")
        }
    }
}

struct MainMenu_Previews: PreviewProvider {
    static var previews: some View {
        MainMenu()
    }
}
