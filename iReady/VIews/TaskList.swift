//
//  TaskList.swift
//  iReady
//
//  Created by Krajg Larson on 2/25/24.
//

import SwiftUI

struct TaskListView: View {
    @State private var tasks: [TaskModel] = []
    @State private var newTaskText: String = ""
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter a new task", text: $newTaskText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: addTask) {
                    Text("Add")
                }
            }
            List {
                ForEach(tasks) { task in
                    TaskItemView(task: task, onDelete: { deleteTask(task) }, onToggle: { toggleTask(task) })
                }
            }
        }
        .padding()
    }
    
    private func addTask() {
        guard !newTaskText.isEmpty else { return }
        let task = TaskModel(text: newTaskText)
        tasks.append(task)
        newTaskText = ""
    }
    
    private func deleteTask(_ task: TaskModel) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks.remove(at: index)
        }
    }
    
    private func toggleTask(_ task: TaskModel) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].isCompleted.toggle()
        }
    }
}

struct TaskItemView: View {
    let task: TaskModel
    var onDelete: () -> Void
    var onToggle: () -> Void
    
    var body: some View {
        HStack {
            Button(action: onToggle) {
                Image(systemName: task.isCompleted ? "checkmark.square" : "square")
            }
            .buttonStyle(BorderlessButtonStyle())
            
            Text(task.text)
                .strikethrough(task.isCompleted)
            
            Spacer()
            
            Button(action: onDelete) {
                Image(systemName: "trash")
            }
            .buttonStyle(BorderlessButtonStyle())
        }
    }
}

struct TaskModel: Identifiable {
    let id = UUID()
    var text: String
    var isCompleted: Bool = false
}

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
    }
}
