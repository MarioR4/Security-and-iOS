//
//  Borrar9.swift
//  JohnDeere_iPhone
//
//  Created by MARIO ISAI ROBLES LOZANO on 18/11/22.
//

import SwiftUI

struct Borrar9: View {
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
    
    @State private var didTap1:Bool = false
    @State private var didTap2:Bool = false
    @State private var didTap3:Bool = false
    @State private var didTap4:Bool = false
    
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
                Text("O?")
                    .foregroundColor(Color(dataSource.selectedTheme.fontColor))
                    .font(.system(size: 40))
                    .padding(.leading)
                Spacer()
            }
            
            // Respuestas
            HStack {
                Spacer()
                Button() {
                    self.didTap1 = true
                } label: {
                    AsyncImage(url: URL(string: "https://drive.google.com/uc?id=1lW3GBsjicnnZmaciMqTUSZmVgZDh0ixs")) { image in
                              image
                                  .resizable()
                                  .aspectRatio(contentMode: .fill)
                                  
                          } placeholder: {
                              Color.gray
                          }
                          .frame(width: 110, height: 110)
                          .background(RoundedRectangle(cornerRadius: 10)
                            .fill(didTap1 ? Color(.green) : Color(dataSource.selectedTheme.boxesColor))
                            .frame(width: 170, height: 120)
                          )
                          .padding()
                }
                
                Spacer()
                
                Button() {
                    self.didTap2 = true
                } label: {
                    AsyncImage(url: URL(string: "https://drive.google.com/uc?id=1AMEZuNd8-J2CE7Yncn-MbwCHw5X4LQor")) { image in
                              image
                                  .resizable()
                                  .aspectRatio(contentMode: .fill)
                                  
                          } placeholder: {
                              Color.gray
                          }
                          .frame(width: 110, height: 110)
                          .background(RoundedRectangle(cornerRadius: 10)
                            .fill(didTap2 ? Color(.red) : Color(dataSource.selectedTheme.boxesColor))
                            .frame(width: 170, height: 120)
                          )
                          .padding()
                }
                Spacer()
            }
            HStack {
                Spacer()
                Button() {
                    self.didTap3 = true
                } label: {
                    AsyncImage(url: URL(string: "https://drive.google.com/uc?id=10gVAIA4F5Dgzgxp9Br1e3MxGyU4nLj6D")) { image in
                              image
                                  .resizable()
                                  .aspectRatio(contentMode: .fill)
                                  
                          } placeholder: {
                              Color.gray
                          }
                          .frame(width: 110, height: 110)
                          .background(RoundedRectangle(cornerRadius: 10)
                            .fill(didTap3 ? Color(.red) : Color(dataSource.selectedTheme.boxesColor))
                            .frame(width: 170, height: 120)
                          )
                          .padding()
                }
                
                Spacer()
                
                Button() {
                    self.didTap4 = true
                } label: {
                    AsyncImage(url: URL(string: "https://drive.google.com/uc?id=106mY7gKUZrnKmEVRybrLOoAAYiQ4BmSL")) { image in
                              image
                                  .resizable()
                                  .aspectRatio(contentMode: .fill)
                                  
                          } placeholder: {
                              Color.gray
                          }
                          .frame(width: 110, height: 110)
                          .background(RoundedRectangle(cornerRadius: 10)
                            .fill(didTap4 ? Color(.red) : Color(dataSource.selectedTheme.boxesColor))
                            .frame(width: 170, height: 120)
                          )
                          .padding()
                }
                Spacer()
            }
            
            NavigationLink(
                destination: Borrar10(quizTitle: "\(quizTitle)", quizWord: "\(quizWord)", quizProgress: (quizProgress + 0.1)
            ), label:{
                Text("Verificar")
                    .foregroundColor(Color(dataSource.selectedTheme.fontColor))
                    .font(.system(size: 24))
                    .frame(width: 360, height: 50)
                    .background(Color(dataSource.selectedTheme.secondaryColor))
                    .cornerRadius(10)
                    .padding([.bottom, .horizontal])
            })
            
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

struct Borrar9_Previews: PreviewProvider {
    static var previews: some View {
        Borrar9(quizTitle: "No se encontró", quizWord: "No se encontró", quizProgress: 0.0)
            .environmentObject(DataSource())
    }
}
