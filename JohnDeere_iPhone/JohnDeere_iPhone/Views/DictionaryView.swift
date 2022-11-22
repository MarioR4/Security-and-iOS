//
//  DictionaryView.swift
//  JohnDeere_iPhone
//
//  Created by MARIO ISAI ROBLES LOZANO on 13/11/22.
//

import SwiftUI

struct DictionaryView: View {
    
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
    
    @State private var isExpanded = false
    @State private var selectedCategory = "Todos"
    
    private let categorias = ["Todos",
                              "Abecedario",
                              "Colores",
                              "Otros"]
    private let palabras = ["A",
                          "Abrazo",
                          "Amarillo",
                          "Azul",
                          "B",
                          "Beso",
                          "Blanco",
                          "C"]
    
    var body: some View {
        VStack {
            // Header de Diccionario
            HStack {
                Text("Diccionario")
                    .navigationBarTitleDisplayMode(.inline)
                    //.padding()
                    .foregroundColor(Color(dataSource.selectedTheme.fontColor))
                    .font(.system(size: 62).weight(.bold))
                    .padding(.leading)
                Spacer()
            }
            .frame(height: 128)
            .background(Color(dataSource.selectedTheme.tertiaryColor).ignoresSafeArea())
            
            // Dropdown Menu
            DisclosureGroup(isExpanded: $isExpanded) {
                ScrollView(showsIndicators: false) {
                    VStack {
                        Text("Todos")
                            .frame(width: 300, height: 30)
                            .foregroundColor(Color(dataSource.selectedTheme.fontColor))
                            .font(.system(size: 24))
                            .padding(.bottom)
                            .onTapGesture {
                                // Funcion para des - Categorizar el scrollview
                                self.selectedCategory = "Todos"
                                withAnimation {
                                    self.isExpanded.toggle()
                                }
                            }
                        ForEach(viewModel.courses, id: \.self) { courses in
                            Text("\(courses.categoria)")
                                .frame(width: 300, height: 30)
                                .foregroundColor(Color(dataSource.selectedTheme.fontColor))
                                .font(.system(size: 24))
                                .padding(.bottom)
                                .onTapGesture {
                                    // Funcion para Categorizar el scrollview
                                    self.selectedCategory = courses.categoria
                                    withAnimation {
                                        self.isExpanded.toggle()
                                    }
                                }
                        }
                    }
                }
                .frame(height: 200)
            } label: {
                Text("\(selectedCategory)")
                    .padding()
            }
            .foregroundColor(Color(dataSource.selectedTheme.fontColor))
            .font(.system(size: 24))
            .background(RoundedRectangle(cornerRadius: 10)
                .fill(Color(dataSource.selectedTheme.boxesColor))
                //.frame(width: 360, height: 160)
            )
            .padding()
            
            // Lista de Palabras
            ScrollView(showsIndicators: false) {
                ForEach(viewModel.courses, id: \.self) { courses in
                    HStack {
                        NavigationLink(destination: WordView(wordFromDictionary: "\(courses.name)", wordHandURL: courses.link_draw, wordIconURL: courses.link_icono), label:{
                            Text("\(courses.name)")
                                .foregroundColor(Color(dataSource.selectedTheme.fontColor))
                                .font(.system(size: 24))
                                .frame(width: 260, height: 50)
                                .background(Color(dataSource.selectedTheme.boxesColor))
                                .cornerRadius(10)
                                .padding([.bottom, .horizontal])
                        })
                        Spacer()
                        RoundedRectangle(cornerRadius: 10)
                        // selectedTab == tab ? Color(tabBarColor) : Color(.gray)
                            .fill(courses.estatus == "yes" ? .green : .red)
                            .frame(width: 50, height: 50)
                            .padding([.bottom, .trailing])
                    }
                }
            }
            //.background(Color.red)
            .frame(maxWidth: .infinity, minHeight: 60)
            .padding(.horizontal)
            
            //Spacer()
            
            // Blank space where the TabBar is
            Spacer()
                .frame(height: 82)
        }
        .background(Color(dataSource.selectedTheme.backgroundColor)
            .ignoresSafeArea())
        //.offset(y: -90)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: btnBack)
    }
}

struct DictionaryView_Previews: PreviewProvider {
    static var previews: some View {
        DictionaryView()
            .environmentObject(DataSource())
    }
}
