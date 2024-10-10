//
//  ContentView.swift
//  MathGame
//
//  Created by Isuru Ariyarathna on 2024-10-09.
//

import SwiftUI

struct MainView: View {
    @State var marks = 0
    @AppStorage("selectedColor") var selectedColor: String = "Red"
    @AppStorage("fontSize") var fontSize: Double = 1
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
        .accentColor(settingsViewModel.getColor(for: selectedColor))
    }
}

#Preview {
    MainView()
}
