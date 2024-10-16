//
//  ContentView.swift
//  MathGame
//
//  Created by Isuru Ariyarathna on 2024-10-09.
//

import SwiftUI

struct MainView: View {
    @State var marks = 0
    @StateObject var settingsViewModel = SettingsViewModel()
    
    var body: some View {
        TabView {
            GuessView(marks: $marks)
                .tabItem {
                    VStack {
                        Image(systemName: "checkmark.circle.badge.questionmark.fill")
                        Text("Guess")
                            .font(.system(size: 200))
                    }
                }
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear.circle.fill")
                }
        }
        .accentColor(Color(settingsViewModel.selectedColor.rawValue))
    }
}

#Preview {
    MainView()
}
