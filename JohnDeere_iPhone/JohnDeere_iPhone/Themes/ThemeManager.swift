//
//  ThemeManager.swift
//  JohnDeere_iPhone
//
//  Created by MARIO ISAI ROBLES LOZANO on 16/10/22.
//

import Foundation

enum ThemeManager {
    static let themes: [Theme] = [DefaultLightTheme(),
                                  DefaultDarkTheme(),
                                  NoirTheme(),
                                  PastelTheme()]
    
    static func getTheme(_ theme: Int) -> Theme {
        Self.themes[theme]
    }
}
