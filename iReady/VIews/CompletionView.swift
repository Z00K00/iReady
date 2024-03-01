//
//  CompletionView.swift
//  iReady
//
//  Created by Krajg Larson on 2/25/24.
//

import SwiftUI

struct CompletionView: View {
    var body: some View {
        VStack {
            Text("Congratulations!")
                .font(.title)
                .padding()
            
            Text("You have successfully completed your work or study session.")
                .padding()
            
            HStack {
                Button(action: {
                    // Start the next session action
                    // Implement your logic here
                }) {
                    Text("Start Next Session")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()
                
                Button(action: {
                    // Return to the main screen action
                    // Implement your logic here
                }) {
                    Text("Return to Main Screen")
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()
            }
        }
        .navigationTitle("Session Completed")
    }
}

struct CompletionView_Previews: PreviewProvider {
    static var previews: some View {
        CompletionView()
    }
}
