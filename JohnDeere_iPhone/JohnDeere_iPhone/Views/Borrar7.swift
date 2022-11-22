//
//  Borrar7.swift
//  JohnDeere_iPhone
//
//  Created by MARIO ISAI ROBLES LOZANO on 18/11/22.
//

import SwiftUI

struct Borrar7: View {
    @EnvironmentObject var dataSource: DataSource
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var viewModel = ViewModel()

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
    
    @State private var didTap1:Bool = false
    @State private var didTap2:Bool = false
    @State private var didTap3:Bool = false
    @State private var didTap4:Bool = false
    
    var quizTitle: String
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
            // Header de Diccionario
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
            
            AsyncImage(url: URL(string: "https://drive.google.com/uc?id=11cMGzigExdgh5lRyXlSa4JZQYuPpdgiI")) { image in
                      image
                          .resizable()
                          .aspectRatio(contentMode: .fill)
                          
                  } placeholder: {
                      Color.gray
                  }
                  .frame(width: 190, height: 190)
                  .background(RoundedRectangle(cornerRadius: 10)
                    .fill(Color(dataSource.selectedTheme.boxesColor))
                    .frame(width: 360, height: 200)
                  )
                  .padding()
            
            HStack {
                Text("¿Cuál representa?")
                    .foregroundColor(Color(dataSource.selectedTheme.fontColor))
                    .font(.system(size: 30))
                    .padding(.leading)
                Spacer()
            }
            
            // Respuestas
            HStack {
                Spacer()
                Button() {
                    self.didTap1 = true
                } label: {
                    AsyncImage(url: URL(string: "https://drive.google.com/uc?id=1obM0Ce4clDpYQP3Fq2r-__oOLeQ2-Q2_")) { image in
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
                    AsyncImage(url: URL(string: "https://drive.google.com/uc?id=1gM7AOm5DgxuSRxb2TZa5DlksIRIqP-jV")) { image in
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
            
            NavigationLink(
                destination: Borrar8(quizTitle: "\(quizTitle)", quizWord: "\(quizWord)", quizProgress: (quizProgress + 0.1)
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

struct Borrar7_Previews: PreviewProvider {
    static var previews: some View {
        Borrar7(quizTitle: "No se encontró", quizWord: "No se encontró", quizProgress: 0.0)
            .environmentObject(DataSource())
    }
}
