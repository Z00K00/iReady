//
//  ContentView.swift
//  iReady
//
//  Created by Krajg Larson on 2/25/24.
//

import SwiftUI
import UserNotifications


struct YourAppNameApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Spacer()

                Image("iReady-2")
                    .resizable()
                    .aspectRatio(contentMode: .fill) // Change contentMode to fill
                    .frame(width: 250, height: 250)
                    .clipShape(Circle())
                    .shadow(radius: 10)
                    .padding() // Add padding to main

                Text("Welcome to iReady")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 20)
                    
                Text("Empower Your Productivity with iReady:\nTime Management, Tasks, Motivation, and Insights, \nAll in One Place!")
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
                    .padding(.bottom, 20)
                    
                NavigationLink(destination: MainMenu()) {
                    Text("Get Started")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding(.horizontal, 20)
                }
                .padding(.bottom, 40)

                Spacer()
            }
            .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
