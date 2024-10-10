//
//  SettingsViewModel.swift
//  MathGame
//
//  Created by Isuru Ariyarathna on 2024-10-09.
//

import SwiftUI

class SettingsViewModel: ObservableObject {
    func getColor(for name: String) -> Color {
            switch name {
            case "Red":
                return .red
            case "Green":
                return .green
            case "Blue":
                return .blue
            case "Tartan":
                return Color(red: 0.5, green: 0.5, blue: 0.5)
            default:
                return .black
            }
        }
}
