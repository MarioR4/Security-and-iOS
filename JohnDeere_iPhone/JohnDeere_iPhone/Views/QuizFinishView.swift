//
//  QuizFinishView.swift
//  JohnDeere_iPhone
//
//  Created by MARIO ISAI ROBLES LOZANO on 14/11/22.
//

import SwiftUI

struct QuizFinishView: View {
    
    @EnvironmentObject var dataSource: DataSource
    
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 82)
            Text("¡Felicidades!")
            Spacer()
                .frame(height: 164)
            Text("Completaste el quiz")
            NavigationLink(destination: MyCourseView(), label:{
                Text("Terminar")
                    .foregroundColor(Color(dataSource.selectedTheme.fontColor))
                    .font(.system(size: 24))
                    .frame(width: 360, height: 50)
                    .background(Color(dataSource.selectedTheme.secondaryColor))
                    .cornerRadius(10)
                    .padding([.bottom, .horizontal])
            })
            Spacer()
                .frame(height: 82)
        }
    }
}

struct QuizFinishView_Previews: PreviewProvider {
    static var previews: some View {
        QuizFinishView()
            .environmentObject(DataSource())
    }
}
