//
//  ContentView.swift
//  JohnDeere_iPhone
//
//  Created by MARIO ISAI ROBLES LOZANO on 15/10/22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var dataSource: DataSource

    @State var selectedTab: Tabs = .profile
    
    //@ObservedObject var viewModel = ViewModel()
    
    init() {
        UITabBar.appearance().isHidden = true
        // not reserve the space for the tab var when using TabView
    }
    
    var body: some View {
        ZStack {
            Color(dataSource.selectedTheme.backgroundColor)
                .ignoresSafeArea()
            //VStack {
            /*Spacer()
             Text("Sample Text")
             .foregroundColor(Color(dataSource.selectedTheme.fontColor))
             Rectangle()
             .fill(Color("DefaultBoxes"))
             .frame(width: 100, height: 100)
             //.shadow(radius: 10, x: 0, y: 5)
             ForEach(0..<ThemeManager.themes.count, id: \.self) {theme in
             Button(ThemeManager.themes[theme].themeName) {
             dataSource.selectedThemeAppStorage = theme
             }
             }*/
            //Spacer()
            TabView(selection: $selectedTab) {
                NavigationView {
                    HStack {
                        switch selectedTab {
                        case .myCourse:
                            MyCourseView()
                        case .jDCourse:
                            TechnicalCourseView()
                        case .profile:
                            ProfileView()
                        case .admin:
                            AdminView()
                        case .settings:
                            SettingsView()
                        }
                    }
                }
                .safeAreaInset(edge: .bottom, spacing: 0) {
                    TabBar(selectedTab: $selectedTab)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(DataSource())
    }
}
