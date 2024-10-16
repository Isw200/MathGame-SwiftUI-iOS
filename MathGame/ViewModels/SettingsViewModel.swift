//
//  SettingsViewModel.swift
//  MathGame
//
//  Created by Isuru Ariyarathna on 2024-10-09.
//

import SwiftUI

class SettingsViewModel: ObservableObject {
    @AppStorage("fontSize") var fontSize: Double = 1
    @AppStorage("selectedColor") var selectedColor: AppTheme = .Red
}
