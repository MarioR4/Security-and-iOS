//
//  TabBar.swift
//  JohnDeere_iPhone
//
//  Created by MARIO ISAI ROBLES LOZANO on 16/10/22.
//

import SwiftUI

enum Tabs: String, CaseIterable {
    case myCourse = "hand.raised"
    case jDCourse = "newspaper"
    case profile = "person"
    case admin = "person.2.crop.square.stack"
    case settings = "gearshape"
}

struct TabBar: View {
    
    @EnvironmentObject var dataSource: DataSource
    @Binding var selectedTab: Tabs
    private var fillImage: String {
        selectedTab.rawValue + ".fill"
    }
    
    private var tabBarColor: UIColor {
        switch selectedTab {
        case .myCourse:
            return dataSource.selectedTheme.secondaryColor
        case .jDCourse:
            return dataSource.selectedTheme.primaryColor
        case .profile:
            return dataSource.selectedTheme.quaternaryColor
        case .admin:
            return dataSource.selectedTheme.tertiaryColor
        case .settings:
            return dataSource.selectedTheme.senaryColor
        }
    }
    
    var body: some View {
        HStack (alignment: .center) {
            ForEach(Tabs.allCases, id: \.rawValue) { tab in
                Button {
                    selectedTab = tab
                } label: {
                    GeometryReader { geo in
                        VStack (alignment: .center) {
                            Image(systemName: selectedTab == tab ? fillImage : tab.rawValue)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .foregroundColor(selectedTab == tab ? Color(tabBarColor) : Color(.gray))
                                .scaleEffect(selectedTab == tab ? 1.25 : 1.0)
                                .onTapGesture {
                                    withAnimation(.easeIn(duration: 0.1)) {
                                        selectedTab = tab
                                    }
                                }
                        }
                        .frame(width: geo.size.width, height: geo.size.height)
                        
                    }
                }
            }
        }
        .frame(height: 82)
        .background(Color(dataSource.selectedTheme.boxesColor))
        
        /*HStack (alignment: .center) {
            Button {
                //Switch to My Course View
                selectedTab = .myCourse
            } label: {
                TabBarButton(buttonText: "Curso",
                             imageName: "globe",
                             isActive: selectedTab == .myCourse,
                             colorName: dataSource.selectedTheme.secondaryColor)
                .onTapGesture {
                    withAnimation(.easeIn(duration: 0.1)) {
                        selectedTab = .myCourse
                    }
                }
            }
            .tint(Color(dataSource.selectedTheme.secondaryColor))
            
            Button {
                //Switch to JD Course View
                selectedTab = .jDCourse
                
            } label: {
                TabBarButton(buttonText: "JD",
                             imageName: "globe",
                             isActive: selectedTab == .jDCourse,
                             colorName: dataSource.selectedTheme.primaryColor)
            }
            .tint(Color(dataSource.selectedTheme.primaryColor))
            
            Button {
                //Switch to Profile View
                selectedTab = .profile
                
            } label: {
                TabBarButton(buttonText: "Perfil",
                             imageName: "globe",
                             isActive: selectedTab == .profile,
                             colorName: dataSource.selectedTheme.quaternaryColor)
            }
            .tint(Color(dataSource.selectedTheme.quaternaryColor))
            
            Button {
                //Switch to Admin View
                selectedTab = .admin
                
            } label: {
                TabBarButton(buttonText: "Admin",
                             imageName: "globe",
                             isActive: selectedTab == .admin,
                             colorName: dataSource.selectedTheme.tertiaryColor)
            }
            .tint(Color(dataSource.selectedTheme.tertiaryColor))
            
            Button {
                //Switch to Settings View
                selectedTab = .settings
                
            } label: {
                TabBarButton(buttonText: "Config",
                             imageName: "globe",
                             isActive: selectedTab == .settings,
                             colorName: dataSource.selectedTheme.senaryColor)
            }
            .tint(Color(dataSource.selectedTheme.senaryColor))
            
        }
        .frame(height: 82)
        .background(Color(dataSource.selectedTheme.boxesColor))*/
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar(selectedTab: .constant(.profile))
            .environmentObject(DataSource())
    }
}
