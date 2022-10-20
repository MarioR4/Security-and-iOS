//
//  ProfileView.swift
//  JohnDeere_iPhone
//
//  Created by MARIO ISAI ROBLES LOZANO on 16/10/22.
//

import SwiftUI

struct ProgressBar: View {
    
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
            .cornerRadius(6)
        }
    }
}

struct ProfileView: View {
    
    @EnvironmentObject var dataSource: DataSource
    @State var quizProgress: Float = 0.2
    @State var wordProgress: Float = 0.5
    
    private let quizes = ["Conferencias",
                          "Pitch",
                          "Saludo",
                          "Formal",
                          "Despedida",
                          "Alimentos",
                          "Animales",
                          "Objetos"]
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .foregroundColor(Color(dataSource.selectedTheme.quaternaryColor))
                    .padding([.horizontal, .bottom])
                VStack {
                    Text("Mario44")
                        .padding([.top, .leading])
                        .foregroundColor(Color(dataSource.selectedTheme.fontColor))
                        .font(.system(size: 55))
                    Text("Técnico de John Deere")
                        .padding([.bottom])
                        .foregroundColor(Color(dataSource.selectedTheme.fontColor))
                        .font(.system(size: 30))
                }
                Spacer()
            }
            .frame(height: 200)
            .background(Color(dataSource.selectedTheme.quinaryColor).ignoresSafeArea())
            
            // Parte de las estadísticas
            HStack {
                VStack {
                    HStack {
                        Text("Mi Progreso")
                            .foregroundColor(Color(dataSource.selectedTheme.fontColor))
                            .font(.system(size: 62).weight(.bold))
                        Spacer()
                    }
                    HStack {
                        Text("Puntaje")
                            .foregroundColor(Color(dataSource.selectedTheme.fontColor))
                            .font(.system(size: 30))
                        Spacer()
                        ForEach(1...3, id: \.self) { i in
                            Image(systemName: "star.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .foregroundColor(Color(dataSource.selectedTheme.primaryColor))
                        }
                        ForEach(1...2, id: \.self) { i in
                            Image(systemName: "star")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .foregroundColor(Color(dataSource.selectedTheme.primaryColor))
                        }
                    }
                    HStack {
                        VStack {
                            HStack {
                                Text("Quizes hechos")
                                    .foregroundColor(Color(dataSource.selectedTheme.fontColor))
                                    .font(.system(size: 23))
                                Spacer()
                            }
                            Spacer()
                                .frame(height: 10)
                            HStack {
                                Text("Palabras Aprendidas")
                                    .foregroundColor(Color(dataSource.selectedTheme.fontColor))
                                    .font(.system(size: 23))
                                Spacer()
                            }
                        }
                        Spacer()
                        VStack {
                            ProgressBar(value: $quizProgress)
                                .frame(width: 100, height: 22)
                            Spacer()
                                .frame(height: 10)
                            ProgressBar(value: $wordProgress)
                                .frame(width: 100, height: 22)
                        }
                        VStack {
                            Text("23/70")
                                .foregroundColor(Color(dataSource.selectedTheme.fontColor))
                                .font(.system(size: 16))
                            Spacer()
                                .frame(height: 15)
                            Text("100/200")
                                .foregroundColor(Color(dataSource.selectedTheme.fontColor))
                                .font(.system(size: 16))
                        }
                    }
                }
                Spacer()
            }
            .padding()
            
            // Parte de Mis Logros
            HStack {
                VStack {
                    HStack {
                        Text("Mis Logros")
                            .foregroundColor(Color(dataSource.selectedTheme.fontColor))
                            .font(.system(size: 30))
                        Spacer()
                    }
                    HStack {
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(0...3, id: \.self) {theme in
                                    Button() {
                                        
                                    } label: {
                                        Image(systemName: "medal.fill")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 80, height: 80)
                                            .foregroundColor(Color(dataSource.selectedTheme.secondaryColor))
                                            .padding([.leading, .bottom])
                                    }
                                    
                                }
                            }
                        }
                        //.background(Color.red)
                        .frame(maxWidth: .infinity, minHeight: 60)
                        .padding(.horizontal)
                    }
                }
                .padding(.leading)
                Spacer()
            }
            
            // Parte de Mis Amigos
            HStack {
                VStack {
                    HStack {
                        Text("Amigos")
                            .foregroundColor(Color(dataSource.selectedTheme.fontColor))
                            .font(.system(size: 30))
                        Spacer()
                    }
                    HStack {
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(0...5, id: \.self) {theme in
                                    Button() {
                                        
                                    } label: {
                                        Image(systemName: "person.circle.fill")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 80, height: 80)
                                            .foregroundColor(Color(dataSource.selectedTheme.senaryColor))
                                            .padding([.leading, .bottom])
                                    }
                                    
                                }
                            }
                        }
                        //.background(Color.red)
                        .frame(maxWidth: .infinity, minHeight: 60)
                        .padding(.horizontal)
                    }
                }
                .padding(.leading)
                Spacer()
            }
            Spacer()
            
            // Blank space where the TabBar is
            Spacer()
                .frame(height: 82)
        }
        .background(Color(dataSource.selectedTheme.backgroundColor)
            .ignoresSafeArea())
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(DataSource())
    }
}
