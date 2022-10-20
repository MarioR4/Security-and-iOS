//
//  AdminView.swift
//  JohnDeere_iPhone
//
//  Created by MARIO ISAI ROBLES LOZANO on 16/10/22.
//

import SwiftUI

struct AdminView: View {
    
    @EnvironmentObject var dataSource: DataSource
    
    var body: some View {
        ZStack {
            Color(dataSource.selectedTheme.tertiaryColor)
            Image(systemName: "person.2.crop.square.stack.fill")
                .foregroundColor(Color.white)
                .font(.system(size: 100))
        }
        .background(Color(dataSource.selectedTheme.backgroundColor)
            .ignoresSafeArea())
    }
}

struct AdminView_Previews: PreviewProvider {
    static var previews: some View {
        AdminView()
            .environmentObject(DataSource())
    }
}
