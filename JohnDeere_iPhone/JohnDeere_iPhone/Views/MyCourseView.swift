//
//  MyCourseView.swift
//  JohnDeere_iPhone
//
//  Created by MARIO ISAI ROBLES LOZANO on 16/10/22.
//

import SwiftUI

struct MyCourseView: View {
    
    @EnvironmentObject var dataSource: DataSource
    
    private let quizes = ["ABC",
                          "Colores",
                          "Verbos",
                          "Adjetivos",
                          "Pronombres",
                          "Alimentos",
                          "Animales",
                          "Objetos"]
    
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
                Button() {
                    // Func para llegar al diccionario
                } label: {
                    // character.book.closed.fill
                    Image(systemName: "newspaper.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 125, height: 125)
                        .foregroundColor(Color(dataSource.selectedTheme.quaternaryColor))
                        .padding([.horizontal, .bottom])
                    /*Circle()
                        .fill(Color(dataSource.selectedTheme.quaternaryColor))
                        .frame(width: 125, height: 125)
                        .padding()*/
                }
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
            ScrollView {
                //ForEach(1...quizes.count, id: \.self) { i in
                ForEach(quizes, id: \.self) { i in
                    HStack {
                        Button() {
                            // Func para llevarte a cada quiz
                        } label: {
                            Text("\(i)")
                                .foregroundColor(Color(dataSource.selectedTheme.fontColor))
                                .font(.system(size: 24))
                                .frame(width: 360, height: 50)
                                .background(Color(dataSource.selectedTheme.boxesColor))
                                .cornerRadius(10)
                                .padding([.bottom, .horizontal])
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
    }
}

struct MyCourseView_Previews: PreviewProvider {
    static var previews: some View {
        MyCourseView()
            .environmentObject(DataSource())
    }
}
