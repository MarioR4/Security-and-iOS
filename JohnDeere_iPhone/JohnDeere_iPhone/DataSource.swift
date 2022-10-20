//
//  DataSource.swift
//  JohnDeere_iPhone
//
//  Created by MARIO ISAI ROBLES LOZANO on 16/10/22.
//

import SwiftUI

class DataSource: ObservableObject {
    @AppStorage("selectedTheme") var selectedThemeAppStorage = 0 {
        didSet {
            updateTheme()
        }
    }
    
    init() {
        updateTheme()
    }
    
    @Published var selectedTheme: Theme = DefaultLightTheme()
    
    func updateTheme() {
        selectedTheme = ThemeManager.getTheme(selectedThemeAppStorage)
    }
}
