//
//  ProfileView.swift
//  JohnDeere_iPhone
//
//  Created by MARIO ISAI ROBLES LOZANO on 16/10/22.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Circle()
                    .fill(.blue)
                    .frame(width: 100, height: 100)
                    .edgesIgnoringSafeArea([.bottom])
                Spacer()
                Text("Mario")
                Spacer()
            }.padding().background(Color.cyan)
            VStack {
                Text("Hello")
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
