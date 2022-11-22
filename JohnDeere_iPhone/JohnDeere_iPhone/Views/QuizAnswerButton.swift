//
//  QuizAnswerButton.swift
//  JohnDeere_iPhone
//
//  Created by MARIO ISAI ROBLES LOZANO on 18/11/22.
//

import SwiftUI

struct QuizAnswerButton: View {
    @EnvironmentObject var dataSource: DataSource
    
    var word: String
    
    var body: some View {
        Text("\(word)")
            .foregroundColor(Color(dataSource.selectedTheme.fontColor))
            .font(.system(size: 24))
            .frame(width: 170, height: 120)
            .background(Color(dataSource.selectedTheme.boxesColor))
            .cornerRadius(10)
            .padding([.bottom, .horizontal])
    }
}

struct QuizAnswerButton_Previews: PreviewProvider {
    static var previews: some View {
        QuizAnswerButton(word: "No")
    }
}
