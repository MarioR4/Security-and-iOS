//
//  SettingsView.swift
//  JohnDeere_iPhone
//
//  Created by MARIO ISAI ROBLES LOZANO on 16/10/22.
//

import SwiftUI

struct SettingsView: View {
    
    @EnvironmentObject var dataSource: DataSource
    
    var body: some View {
        VStack {
            // Sección Foto de Perfil
            HStack(alignment: .center) {
                VStack {
                    Button() {
                        // Func para llegar al diccionario
                    } label: {
                        ZStack {
                            Circle()
                                .fill(Color(dataSource.selectedTheme.boxesColor))
                            .frame(width: 185, height: 185)
                            Image(systemName: "camera")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                                .foregroundColor(Color(dataSource.selectedTheme.fontColor))
                                //.padding([.horizontal, .bottom])
                        }
                        // base64 para guardar/comprimir imagenes
                    }
                    HStack {
                        Text("Mario Robles")
                            .font(.system(size: 55))
                            .foregroundColor(Color(dataSource.selectedTheme.fontColor))
                        Button() {
                            // Func para llegar al diccionario
                        } label: {
                            Image(systemName: "pencil")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                                .foregroundColor(Color(dataSource.selectedTheme.fontColor))
                        }
                    }
                    Text("mario-robles" + "@" + "gmail.com")
                        .foregroundColor(Color(dataSource.selectedTheme.fontColor))
                        .font(.system(size: 20))
                }
            }
            //.frame(height: 140)
            //.padding()
            
            // Solo el título de pruebate
            /*HStack {
                VStack {
                    Text("Pruebate")
                        .foregroundColor(Color(dataSource.selectedTheme.fontColor))
                        .font(.system(size: 41))
                }
                .padding([.top, .leading])
                Spacer()
            }*/
            .padding()
            
            // Lista de Quizes
            ScrollView {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(dataSource.selectedTheme.boxesColor))
                        .frame(height: 82)
                        .padding([.bottom, .horizontal])
                    //GeometryReader { geo in
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(0..<ThemeManager.themes.count, id: \.self) {theme in
                                Button() { //ThemeManager.themes[theme].themeName) {
                                    dataSource.selectedThemeAppStorage = theme
                                } label: {
                                    Image(systemName: "app.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 50, height: 50)
                                        .foregroundColor(Color(ThemeManager.themes[theme].primaryColor))
                                        .padding([.leading, .bottom])
                                }
                                
                            }
                            //.frame(width: geo.size.width, height: geo.size.height)
                            
                        }
                    }
                    .padding(.horizontal)
                    //.font(.system(size: 24))
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

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(DataSource())
    }
}
