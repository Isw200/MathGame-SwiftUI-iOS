//
//  SettingsView.swift
//  MathGame
//
//  Created by Isuru Ariyarathna on 2024-10-09.
//

import SwiftUI

enum AppTheme: String, CaseIterable {
    case Red = "Red"
    case Green = "Green"
    case Blue = "Blue"
}

struct SettingsView: View {
    @StateObject var settingsViewModel: SettingsViewModel = SettingsViewModel()
    
    var body: some View {
        NavigationView {
            VStack (alignment: .leading) {
                Text("Font Size: \(String(format: "%.1f", settingsViewModel.fontSize)) X")
                Slider(value: settingsViewModel.$fontSize, in: 0.1...2)
                    .onChange(of: settingsViewModel.fontSize) { newValue in
                        settingsViewModel.fontSize = newValue
                    }
                
                HStack {
                    Text("System Color")
                        .font(.system(size: 18 * settingsViewModel.fontSize))
                    Picker("Please choose a color", selection: settingsViewModel.$selectedColor) {
                        ForEach(AppTheme.allCases, id: \.self) { color in
                            Text(color.rawValue)
                                .font(.system(size: 18 * settingsViewModel.fontSize))
                        }
                    }
                    .pickerStyle(.wheel)
                    
                    Rectangle()
                        .frame(width: 40, height: 40)
                        .foregroundColor(Color(settingsViewModel.selectedColor.rawValue))
                        .cornerRadius(10)
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView()
}
