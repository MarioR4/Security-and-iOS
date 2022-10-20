//
//  JohnDeere_iPhoneApp.swift
//  JohnDeere_iPhone
//
//  Created by MARIO ISAI ROBLES LOZANO on 15/10/22.
//

import SwiftUI

@main
struct JohnDeere_iPhoneApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(DataSource())
            // We have access to the selected theme wherever we are in the environment
        }
    }
}
