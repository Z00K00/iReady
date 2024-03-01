//
//  MainView.swift
//  iReady
//
//  Created by Krajg Larson on 2/25/24.
//

import SwiftUI
import UserNotifications

struct MainView: View {
    @State private var workDuration: TimeInterval = 25 * 60
    @State private var shortBreakDuration: TimeInterval = 5 * 60
    @State private var longBreakDuration: TimeInterval = 15 * 60
    @State private var customWorkDuration: Int = 25
    @State private var customShortBreakDuration: Int = 5
    @State private var customLongBreakDuration: Int = 15
    @State private var timerState: TimerState = .stopped
    @State private var elapsedTime: TimeInterval = 0
    @State private var pomodoroCount: Int = 0
    @State private var isWorkSession: Bool = true
    @State private var timer: Timer?
    
    var body: some View {
        VStack {
            Text(timerState.rawValue)
                .font(.title)
            
            Text(timeString(time: remainingTime()))
                .font(.largeTitle)
                .padding()
            
            ProgressView(value: elapsedTime, total: currentTimerDuration())
                .padding()
            
            HStack {
                VStack {
                    Text("Work Duration (minutes)")
                    TextField("Work Duration", value: $customWorkDuration, formatter: NumberFormatter())
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                VStack {
                    Text("Short Break Duration (minutes)")
                    TextField("Short Break Duration", value: $customShortBreakDuration, formatter: NumberFormatter())
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                VStack {
                    Text("Long Break Duration (minutes)")
                    TextField("Long Break Duration", value: $customLongBreakDuration, formatter: NumberFormatter())
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
            }
            
            HStack {
                Button(action: {
                    startTimer()
                }) {
                    Text("Start")
                }
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(8)
                
                Button(action: {
                    pauseTimer()
                }) {
                    Text("Pause")
                }
                .padding()
                .background(Color.yellow)
                .foregroundColor(.white)
                .cornerRadius(8)
                
                Button(action: {
                    resetTimer()
                }) {
                    Text("Reset")
                }
                .padding()
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(8)
            }
        }
        .padding()
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
            scheduleLocalNotification()
        }
    }
    
    private func startTimer() {
        workDuration = TimeInterval(customWorkDuration) * 60
        shortBreakDuration = TimeInterval(customShortBreakDuration) * 60
        longBreakDuration = TimeInterval(customLongBreakDuration) * 60
        
        if timerState == .stopped {
            timerState = .running
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                elapsedTime += 1
                if elapsedTime >= currentTimerDuration() {
                    timerState = .stopped
                    timer?.invalidate()
                    timer = nil
                    pomodoroCount += 1
                    if isWorkSession && pomodoroCount % 4 == 0 {
                        // Take a long break
                        workSessionEnded()
                        longBreakSessionStarted()
                    } else if isWorkSession {
                        // Take a short break
                        workSessionEnded()
                        shortBreakSessionStarted()
                    } else {
                        // Start a new work session
                        shortBreakSessionEnded()
                        workSessionStarted()
                    }
                    scheduleLocalNotification()
                }
            }
        } else if timerState == .paused {
            timerState = .running
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                elapsedTime += 1
                if elapsedTime >= currentTimerDuration() {
                    timerState = .stopped
                    timer?.invalidate()
                    timer = nil
                    pomodoroCount += 1
                    if isWorkSession && pomodoroCount % 4 == 0 {
                        // Take a long break
                        workSessionEnded()
                        longBreakSessionStarted()
                    } else if isWorkSession {
                        // Take a short break
                        workSessionEnded()
                        shortBreakSessionStarted()
                    } else {
                        // Start a new work session
                        shortBreakSessionEnded()
                        workSessionStarted()
                    }
                    scheduleLocalNotification()
                }
            }
        }
    }
    
    private func pauseTimer() {
        if timerState == .running {
            timerState = .paused
            timer?.invalidate()
            timer = nil
        }
    }
    
    private func resetTimer() {
        timerState = .stopped
        elapsedTime = 0
        pomodoroCount = 0
        isWorkSession = true
        timer?.invalidate()
        timer = nil
    }
    
    private func timeString(time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    private func remainingTime() -> TimeInterval {
        return currentTimerDuration() - elapsedTime
    }
    
    private func currentTimerDuration() -> TimeInterval {
        if isWorkSession {
            return workDuration
        } else if pomodoroCount % 4 == 0 {
            return longBreakDuration
        } else {
            return shortBreakDuration
        }
    }
    
    private func workSessionStarted() {
        isWorkSession = true
        elapsedTime = 0
    }
    
    private func workSessionEnded() {
        isWorkSession = false
        elapsedTime = 0
    }
    
    private func shortBreakSessionStarted() {
        isWorkSession = false
        elapsedTime = 0
    }
    
    private func shortBreakSessionEnded() {
        isWorkSession = true
        elapsedTime = 0
    }
    
    private func longBreakSessionStarted() {
        isWorkSession = false
        elapsedTime = 0
    }
    
    private func scheduleLocalNotification() {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound]) { granted, error in
            if let error = error {
                print("Error requesting notification authorization: \(error.localizedDescription)")
            } else if granted {
                let content = UNMutableNotificationContent()
                content.title = "Session Alert"
                content.body = "Your session is complete!"
                content.sound = UNNotificationSound.default

                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                
                center.add(request)
            }
        }
    }
}

enum TimerState: String {
    case running = "Running"
    case paused = "Paused"
    case stopped = "Stopped"
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
