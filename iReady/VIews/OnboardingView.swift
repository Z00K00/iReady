//
//  OnboardingView.swift
//  iReady
//
//  Created by Krajg Larson on 2/25/24.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        TabView {
            // First onboarding screen
            VStack {
                Text("Welcome to Your App")
                    .font(.title)
                    .padding()
                
                Text("This is an onboarding screen providing an introduction to your app.")
                    .padding()
            }
            .tag(0)
            
            // Second onboarding screen
            VStack {
                Text("Setting Up Sessions")
                    .font(.title)
                    .padding()
                
                Text("Here, you can guide users on how to set up sessions.")
                    .padding()
            }
            .tag(1)
            
            // Third onboarding screen
            VStack {
                Text("Adding Tasks")
                    .font(.title)
                    .padding()
                
                Text("This onboarding screen provides a tutorial on adding tasks.")
                    .padding()
            }
            .tag(2)
            
            // Fourth onboarding screen
            VStack {
                Text("Utilizing Features")
                    .font(.title)
                    .padding()
                
                Text("Here, users can learn about utilizing various features of the app.")
                    .padding()
            }
            .tag(3)
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        .navigationTitle("Onboarding")
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
