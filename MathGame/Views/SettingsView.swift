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
    @AppStorage("fontSize") var fontSize: Double = 1
    @AppStorage("selectedColor") var selectedColor: AppTheme = .Red
    @StateObject var settingsViewModel: SettingsViewModel = SettingsViewModel()
    
    var body: some View {
        NavigationView {
            VStack (alignment: .leading) {
                Text("Font Size: \(String(format: "%.1f", fontSize)) X")
                Slider(value: $fontSize, in: 0.1...2)
                    .onChange(of: fontSize) { newValue in
//                        UserDefaults.standard.set(newValue, forKey: "fontSize")
                        fontSize = newValue
                    }
//                    .tint(Color(selectedColor.rawValue))
                
                HStack {
                    Text("System Color")
                        .font(.system(size: 18 * fontSize))
                    Picker("Please choose a color", selection: $selectedColor) {
                        ForEach(AppTheme.allCases, id: \.self) { color in
                            Text(color.rawValue)
                                .font(.system(size: 18 * fontSize))
                        }
                    }
                    .pickerStyle(.wheel)
                    
                    Rectangle()
                        .frame(width: 40, height: 40)
                        .foregroundColor(settingsViewModel.getColor(for: selectedColor.rawValue))
                        .cornerRadius(10)
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("Settings")
            .onAppear {
                print("Current font size: \(fontSize)")
                print("Current selected color: \(selectedColor)")
            }
        }
    }
}

#Preview {
    SettingsView()
}
