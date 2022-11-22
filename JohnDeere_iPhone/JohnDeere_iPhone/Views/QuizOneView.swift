//
//  QuizOneView.swift
//  JohnDeere_iPhone
//
//  Created by MARIO ISAI ROBLES LOZANO on 13/11/22.
//

import SwiftUI

struct QuizProgressBar: View {
    
    @EnvironmentObject var dataSource: DataSource
    @Binding var value: Float
    
    var body: some View {
        GeometryReader {geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .foregroundColor(Color(dataSource.selectedTheme.boxesColor))
                Rectangle()
                    .frame(width: min(CGFloat(self.value) * geometry.size.width, geometry.size.width), height: geometry.size.height)
                    .foregroundColor(Color(dataSource.selectedTheme.primaryColor))
            }
            .cornerRadius(15)
        }
    }
}

struct QuizOneView: View {
    
    @EnvironmentObject var dataSource: DataSource
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var viewModel = ViewModel()
    
    //@State var quizProgressStart: Float = 0.0

    var btnBack : some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "chevron.left")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .foregroundColor(Color(dataSource.selectedTheme.fontColor))
                .padding(.leading, -10)
        }
    }
    
    var quizTitle: String
    
    //let randomCorrectWord = viewModel.courses.randomElement()
    let randomCorrectWord = Int.random(in: 1...7)
    var quizWord: String
    
    @State var quizProgress: Float
    let randomQuestionView = Int.random(in: 1..<4) // 1, 2 or 3
    @State private var quizIsFinished = false
    
    var body: some View {
        if quizIsFinished {
            QuizFinishView()
        }
        else {
            content
        }
    }
    
    var content: some View {
        VStack {
            // Header de Quiz
            HStack {
                Spacer()
                Text(quizTitle)
                    .foregroundColor(Color(dataSource.selectedTheme.fontColor))
                    .font(.system(size: 62).weight(.bold))
                    .padding(.leading)
                    .padding(.top, -20)
                Spacer()
            }
            .frame(height: 100) // 128
            .background(Color(dataSource.selectedTheme.tertiaryColor).ignoresSafeArea())
            
            // Barra de Progreso
            QuizProgressBar(value: $quizProgress)
                .frame(width: 360, height: 30)
                .padding([.top, .bottom])
            
            HStack {
                Text("¿Cuál representa")
                    .foregroundColor(Color(dataSource.selectedTheme.fontColor))
                    .font(.system(size: 40))
                    .padding(.leading)
                Spacer()
            }
            HStack {
                Text("\(quizWord)?")
                    .foregroundColor(Color(dataSource.selectedTheme.fontColor))
                    .font(.system(size: 40))
                    .padding(.leading)
                Spacer()
            }
            
            // Respuestas
            HStack {
                Button() {
                    // Func para llevarte a cada quiz
                } label: {
                    Text("Icono")
                        .foregroundColor(Color(dataSource.selectedTheme.fontColor))
                        .font(.system(size: 24))
                        .frame(width: 170, height: 120)
                        .background(Color(dataSource.selectedTheme.boxesColor))
                        .cornerRadius(10)
                        .padding([.bottom, .horizontal])
                }
                
                Button() {
                    // Func para llevarte a cada quiz
                } label: {
                    Text("Icono")
                        .foregroundColor(Color(dataSource.selectedTheme.fontColor))
                        .font(.system(size: 24))
                        .frame(width: 170, height: 120)
                        .background(Color(dataSource.selectedTheme.boxesColor))
                        .cornerRadius(10)
                        .padding([.bottom, .trailing])
                }
            }
            HStack {
                Button() {
                    // Func para llevarte a cada quiz
                } label: {
                    Text("Icono")
                        .foregroundColor(Color(dataSource.selectedTheme.fontColor))
                        .font(.system(size: 24))
                        .frame(width: 170, height: 120)
                        .background(Color(dataSource.selectedTheme.boxesColor))
                        .cornerRadius(10)
                        .padding([.bottom, .horizontal])
                }
                
                Button() {
                    // Func para llevarte a cada quiz
                } label: {
                    Text("Icono")
                        .foregroundColor(Color(dataSource.selectedTheme.fontColor))
                        .font(.system(size: 24))
                        .frame(width: 170, height: 120)
                        .background(Color(dataSource.selectedTheme.boxesColor))
                        .cornerRadius(10)
                        .padding([.bottom, .trailing])
                }
            }
            
            switch randomQuestionView {
            case 1:
                NavigationLink(
                    destination: QuizOneView(quizTitle: "\(quizTitle)", quizWord: "\(quizWord)", quizProgress: (quizProgress + 0.1)
                ), label:{
                    Text("Verificar")
                        .foregroundColor(Color(dataSource.selectedTheme.fontColor))
                        .font(.system(size: 24))
                        .frame(width: 360, height: 50)
                        .background(Color(dataSource.selectedTheme.secondaryColor))
                        .cornerRadius(10)
                        .padding([.bottom, .horizontal])
                })
            case 2:
                NavigationLink(
                    destination: QuizTwoView(quizTitle: "\(quizTitle)", quizWord: "\(quizWord)", quizProgress: (quizProgress + 0.1)
                ), label:{
                    Text("Verificar")
                        .foregroundColor(Color(dataSource.selectedTheme.fontColor))
                        .font(.system(size: 24))
                        .frame(width: 360, height: 50)
                        .background(Color(dataSource.selectedTheme.secondaryColor))
                        .cornerRadius(10)
                        .padding([.bottom, .horizontal])
                })
            case 3:
                NavigationLink(
                    destination: QuizThreeView(quizTitle: "\(quizTitle)", quizWord: "\(quizWord)", quizProgress: (quizProgress + 0.1)
                ), label:{
                    Text("Verificar")
                        .foregroundColor(Color(dataSource.selectedTheme.fontColor))
                        .font(.system(size: 24))
                        .frame(width: 360, height: 50)
                        .background(Color(dataSource.selectedTheme.secondaryColor))
                        .cornerRadius(10)
                        .padding([.bottom, .horizontal])
                })
            default:
                NavigationLink(
                    destination: QuizOneView(quizTitle: "\(quizTitle)", quizWord: "\(quizWord)", quizProgress: (quizProgress + 0.1)
                ), label:{
                    Text("Verificar")
                        .foregroundColor(Color(dataSource.selectedTheme.fontColor))
                        .font(.system(size: 24))
                        .frame(width: 360, height: 50)
                        .background(Color(dataSource.selectedTheme.secondaryColor))
                        .cornerRadius(10)
                        .padding([.bottom, .horizontal])
                })
            }
            
            Spacer()
            
            // Blank space where the TabBar is
            Spacer()
                .frame(height: 82)
        }
        .background(Color(dataSource.selectedTheme.backgroundColor)
            .ignoresSafeArea())
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: btnBack)
        .onAppear {
            if quizProgress >= 1.1 {
                quizIsFinished.toggle()
            }
        }
    }
}

struct QuizOneView_Previews: PreviewProvider {
    static var previews: some View {
        QuizOneView(quizTitle: "No se encontró", quizWord: "No se encontró", quizProgress: 0.0)
            .environmentObject(DataSource())
    }
}
