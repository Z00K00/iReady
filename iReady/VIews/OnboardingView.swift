//
//  OnboardingView.swift
//  iReady
//
//  Created by Krajg Larson on 2/25/24.
//

import SwiftUI

struct OnboardingView: View {
    enum Feature: Int, CaseIterable {
        case sessions, tasks
        
        var title: String {
            switch self {
            case .sessions:
                "Setting Up Sessions"
            case .tasks:
                "Adding Tasks"
            }
        }
        
        var description: String {
            switch self {
            case .sessions:
                "Here, you can guide users on how to set up sessions."
            case .tasks:
                "This onboarding screen provides a tutorial on adding tasks."
            }
        }
    }
    
    var body: some View {
        TabView {
            ForEach(Feature.allCases, id: \.self) { feature in
                VStack {
                    Text(feature.title)
                        .font(.title)
                        .bold()
                    
                    Text(feature.description)
                        .multilineTextAlignment(.center)
                }
                .tag(feature.rawValue)
            }
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
