//
//  MyCourseView.swift
//  JohnDeere_iPhone
//
//  Created by MARIO ISAI ROBLES LOZANO on 16/10/22.
//

import SwiftUI

struct MyCourseView: View {
    
    @EnvironmentObject var dataSource: DataSource
    @ObservedObject var viewModel = ViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    let quizes = ["Abecedario",
                  "Colores",
                  "Verbos",
                  "Adjetivos",
                  "Pronombres",
                  "Alimentos",
                  "Animales",
                  "Objetos"]
    
    @State var categories: [String] = []
    @State var categoryIs = "Todos"
    @State var counterWords = 0
        
    /*for course in viewModel.courses {
        self.quizes.append(course.categoria)
    }*/
    
    let randomQuestionView = Int.random(in: 1..<4) // 1, 2 or 3
    
    var body: some View {
        VStack {
            // Header de Mi Curso
            HStack {
                Text("Mi Curso")
                    .padding()
                    .foregroundColor(Color(dataSource.selectedTheme.fontColor))
                    .font(.system(size: 62).weight(.bold))
                Spacer()
            }
            .frame(height: 128)
            .background(Color(dataSource.selectedTheme.secondaryColor).ignoresSafeArea())
            
            // Sección de redirección al diccionario
            HStack {
                VStack(alignment: .center) {
                    Text("¡Aprende")
                        .foregroundColor(Color(dataSource.selectedTheme.fontColor))
                        .font(.system(size: 41))
                    Text("más")
                        .foregroundColor(Color(dataSource.selectedTheme.fontColor))
                        .font(.system(size: 41))
                    Text("palabras!")
                        .foregroundColor(Color(dataSource.selectedTheme.fontColor))
                        .font(.system(size: 41))
                }
                .padding()
                
                Spacer()
                
                NavigationLink(destination: DictionaryView(), label:{
                    Image(systemName: "newspaper.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 125, height: 125)
                        .foregroundColor(Color(dataSource.selectedTheme.quaternaryColor))
                        .padding([.horizontal, .bottom])
                })
            }
            .frame(height: 140)
            .padding()
            
            // Solo el título de pruebate
            HStack {
                VStack {
                    Text("Pruebate")
                        .foregroundColor(Color(dataSource.selectedTheme.fontColor))
                        .font(.system(size: 41))
                }
                .padding([.top, .leading])
                Spacer()
            }
            .padding()
            
            // Lista de Quizes
            ScrollView(showsIndicators: false) {
                ForEach(quizes, id: \.self) { quiz in
                //ForEach(viewModel.courses, id: \.self) { course in
                    //self.counterWords += 1
                    HStack {
                        /*NavigationLink(destination: QuizOneView(quizTitle: "\(course.categoria)", quizWord: "\(course.categoria)", quizProgress: 0.1), label:{
                            Text("\(course.categoria)")
                                .foregroundColor(Color(dataSource.selectedTheme.fontColor))
                                .font(.system(size: 24))
                                .frame(width: 360, height: 50)
                                .background(Color(dataSource.selectedTheme.boxesColor))
                                .cornerRadius(10)
                                .padding([.bottom, .horizontal])
                        })*/
                        
                        // Esto es para la expo
                        
                        /*NavigationLink(destination: Borrar1(quizTitle: "\(quiz)", quizWord: "\(quiz)", quizProgress: 0.1
                            ), label:{
                                Text("\(quiz)")
                                    .foregroundColor(Color(dataSource.selectedTheme.fontColor))
                                    .font(.system(size: 24))
                                    .frame(width: 360, height: 50)
                                    .background(Color(dataSource.selectedTheme.boxesColor))
                                    .cornerRadius(10)
                                    .padding([.bottom, .horizontal])
                            })*/
                        
                        switch randomQuestionView {
                        case 1:
                            NavigationLink(destination: QuizOneView(quizTitle: "\(quiz)", quizWord: "\(quiz)", quizProgress: 0.1
                            //NavigationLink(destination: QuizOneView(quizTitle: "\(course.categoria)", quizWord: "\(course.categoria)", quizProgress: 0.1
                                                        ), label:{
                                                            Text("\(quiz)")
                                                            //Text("\(course.categoria)")
                                                                .foregroundColor(Color(dataSource.selectedTheme.fontColor))
                                                                .font(.system(size: 24))
                                                                .frame(width: 360, height: 50)
                                                                .background(Color(dataSource.selectedTheme.boxesColor))
                                                                .cornerRadius(10)
                                                                .padding([.bottom, .horizontal])
                                                        })
                        case 2:
                            NavigationLink(destination: QuizTwoView(quizTitle: "\(quiz)", quizWord: "\(quiz)", quizProgress: 0.1
                            //NavigationLink(destination: QuizTwoView(quizTitle: "\(course.categoria)", quizWord: "\(course.categoria)", quizProgress: 0.1
                                                        ), label:{
                                                            Text("\(quiz)")
                                                            //Text("\(course.categoria)")
                                                                .foregroundColor(Color(dataSource.selectedTheme.fontColor))
                                                                .font(.system(size: 24))
                                                                .frame(width: 360, height: 50)
                                                                .background(Color(dataSource.selectedTheme.boxesColor))
                                                                .cornerRadius(10)
                                                                .padding([.bottom, .horizontal])
                                                        })
                        case 3:
                            NavigationLink(destination: QuizThreeView(quizTitle: "\(quiz)", quizWord: "\(quiz)", quizProgress: 0.1
                            //NavigationLink(destination: QuizThreeView(quizTitle: "\(course.categoria)", quizWord: "\(course.categoria)", quizProgress: 0.1
                                                          ), label:{
                                                                Text("\(quiz)")
                                                              //Text("\(course.categoria)")
                                                                  .foregroundColor(Color(dataSource.selectedTheme.fontColor))
                                                                  .font(.system(size: 24))
                                                                  .frame(width: 360, height: 50)
                                                                  .background(Color(dataSource.selectedTheme.boxesColor))
                                                                  .cornerRadius(10)
                                                                  .padding([.bottom, .horizontal])
                                                          })
                        default:
                            NavigationLink(destination: QuizOneView(quizTitle: "\(quiz)", quizWord: "\(quiz)", quizProgress: 0.1
                            //NavigationLink(destination: QuizOneView(quizTitle: "\(course.categoria)", quizWord: "\(course.categoria)", quizProgress: 0.1
                                                        ), label:{
                                                            Text("\(quiz)")
                                                            //Text("\(course.categoria)")
                                                                .foregroundColor(Color(dataSource.selectedTheme.fontColor))
                                                                .font(.system(size: 24))
                                                                .frame(width: 360, height: 50)
                                                                .background(Color(dataSource.selectedTheme.boxesColor))
                                                                .cornerRadius(10)
                                                                .padding([.bottom, .horizontal])
                                                        })
                        }
                    }
                }
            }
            //.background(Color.red)
            .frame(maxWidth: .infinity, minHeight: 60)
            .padding(.horizontal)
            
            // Blank space where the TabBar is
            Spacer()
                .frame(height: 82)
        }
        .background(Color(dataSource.selectedTheme.backgroundColor)
            .ignoresSafeArea())
        .navigationBarTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

struct MyCourseView_Previews: PreviewProvider {
    static var previews: some View {
        MyCourseView()
            .environmentObject(DataSource())
    }
}
