//
//  ContentView.swift
//  iReady
//
//  Created by Krajg Larson on 2/25/24.
//

import SwiftUI
import UserNotifications

class RootNavigationManager: ObservableObject {
    @Published var isShowingOnboarding = !UserDefaults.standard.bool(forKey: "hasCompletedOnboarding") {
        didSet {
            UserDefaults.standard.setValue(!isShowingOnboarding, forKey: "hasCompletedOnboarding")
        }
    }
}

struct ContentView: View {
    @StateObject var rootNavigationManager = RootNavigationManager()
    var body: some View {
        VStack {
            switch rootNavigationManager.isShowingOnboarding {
            case true:
                WelcomeView()
                    .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
            case false:
                MainMenu()
                    .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
            }
        }
        .environmentObject(rootNavigationManager)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
