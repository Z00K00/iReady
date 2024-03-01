//
//  TaskListViewModel.swift
//  iReady
//
//  Created by Krajg Larson on 2/25/24.
//

import Foundation

class TaskListViewModel: ObservableObject {
    @Published var tasks: [TaskModel] = []

    // Add a new task
    func addTask(text: String) {
        let newTask = TaskModel(text: text)
        tasks.append(newTask)
    }

    // Delete a task
    func deleteTask(task: TaskModel) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks.remove(at: index)
        }
    }

    // Mark a task as completed
    func toggleTaskCompleted(task: TaskModel) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].isCompleted.toggle()
        }
    }
}
