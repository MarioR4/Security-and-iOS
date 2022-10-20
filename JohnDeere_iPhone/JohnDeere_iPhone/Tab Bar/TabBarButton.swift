//
//  TabBarButton.swift
//  JohnDeere_iPhone
//
//  Created by MARIO ISAI ROBLES LOZANO on 16/10/22.
//

import SwiftUI

struct TabBarButton: View {
    
    @EnvironmentObject var dataSource: DataSource
    
    var buttonText: String
    var imageName: String
    var isActive: Bool
    var colorName: UIColor
    
    var body: some View {
        GeometryReader { geo in
            
            /*if (isActive) {
                Rectangle()
                    .fill(Color(colorName))
                    .frame(width: geo.size.width/2, height: 3)
                    .padding(.leading, geo.size.width/4)
            }*/
            
            VStack (alignment: .center) {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .scaleEffect(isActive ? 1.75 : 1.0)
                Text(buttonText)
            }
            .frame(width: geo.size.width, height: geo.size.height)
            
        }
    }
}

struct TabBarButton_Previews: PreviewProvider {
    static var previews: some View {
        TabBarButton(buttonText: "Perfil", imageName: "globe", isActive: true, colorName: UIColor(named: "DefaultQuaternary")!)
            .environmentObject(DataSource())
    }
}
