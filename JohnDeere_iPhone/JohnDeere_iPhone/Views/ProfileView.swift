//
//  ProfileView.swift
//  JohnDeere_iPhone
//
//  Created by MARIO ISAI ROBLES LOZANO on 16/10/22.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var dataSource: DataSource
    
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
            
            // Solo el título de pruebate
            HStack {
                VStack {
                    Text("Mi Progreso")
                        .foregroundColor(Color(dataSource.selectedTheme.fontColor))
                        .font(.system(size: 62).weight(.bold))
                    HStack {
                        Text("Puntaje")
                            .foregroundColor(Color(dataSource.selectedTheme.fontColor))
                            .font(.system(size: 30))
                        ForEach(1...3, id: \.self) { i in
                            Image(systemName: "star.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .foregroundColor(Color(dataSource.selectedTheme.primaryColor))
                                .padding(.bottom)
                        }
                        ForEach(1...2, id: \.self) { i in
                            Image(systemName: "star")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .foregroundColor(Color(dataSource.selectedTheme.primaryColor))
                                .padding(.bottom)
                        }
                    }
                    Text("Mi Progreso")
                        .foregroundColor(Color(dataSource.selectedTheme.fontColor))
                        .font(.system(size: 62).weight(.bold))
                    Text("Mi Progreso")
                        .foregroundColor(Color(dataSource.selectedTheme.fontColor))
                        .font(.system(size: 62).weight(.bold))
                }
                .padding(.leading)
                Spacer()
            }
            .padding()
            
            HStack {
                VStack {
                    Text("Mi Progreso")
                        .foregroundColor(Color(dataSource.selectedTheme.fontColor))
                        .font(.system(size: 62).weight(.bold))
                }
                .padding(.leading)
                Spacer()
            }
            .padding()
            
            HStack {
                VStack {
                    Text("Mi Progreso")
                        .foregroundColor(Color(dataSource.selectedTheme.fontColor))
                        .font(.system(size: 62).weight(.bold))
                }
                .padding(.leading)
                Spacer()
            }
            .padding()
            
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
