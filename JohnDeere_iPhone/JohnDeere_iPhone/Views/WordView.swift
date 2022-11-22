//
//  WordView.swift
//  JohnDeere_iPhone
//
//  Created by MARIO ISAI ROBLES LOZANO on 13/11/22.
//

import SwiftUI

/*struct URLImage: View {
    let urlString: String
    
    @State var data: Data?
    
    var body: some View {
        if let data = data, let uiimage = UIImage(data: data) {
            Image(uiImage: uiimage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 300)
                .background(Color.gray)
                .onAppear {}
        }
        else { // Placeholder image
            Rectangle()
                .fill(Color.gray)
                .frame(width: 300, height: 300)
                .padding()
        }
    }
}*/

struct WordView: View {
    
    @EnvironmentObject var dataSource: DataSource
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

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
    
    var wordFromDictionary: String
    var wordHandURL: String
    var wordIconURL: String
    
    var body: some View {
        VStack {
            // Header de Diccionario
            HStack {
                Spacer()
                Text(wordFromDictionary)
                    .navigationBarTitleDisplayMode(.inline)
                    .foregroundColor(Color(dataSource.selectedTheme.fontColor))
                    .font(.system(size: 62).weight(.bold))
                    .padding(.leading)
                Spacer()
            }
            .frame(height: 100) // 128
            .background(Color(dataSource.selectedTheme.tertiaryColor).ignoresSafeArea())
            
            ScrollView(showsIndicators: false) {
                AsyncImage(url: URL(string: "https://drive.google.com/uc?id=" + wordHandURL)) { image in
                          image
                              .resizable()
                              .aspectRatio(contentMode: .fill)
                              
                      } placeholder: {
                          Color.gray
                      }
                      .frame(width: 300, height: 300)
                      .background(RoundedRectangle(cornerRadius: 25)
                        .fill(Color(dataSource.selectedTheme.boxesColor))
                        .frame(width: 360, height: 360)
                      )
                      .padding()
                //URLImage(urlString: wordIconURL)
                Spacer()
                    .frame(height: 15)
                AsyncImage(url: URL(string: "https://drive.google.com/uc?id=" + wordIconURL)) { image in
                          image
                              .resizable()
                              .aspectRatio(contentMode: .fill)
                              
                      } placeholder: {
                          Color.gray
                      }
                      .frame(width: 300, height: 300)
                      .background(RoundedRectangle(cornerRadius: 25)
                        .fill(Color(dataSource.selectedTheme.boxesColor))
                        .frame(width: 360, height: 360)
                      )
                      .padding()
            }
            //.padding([.top, .bottom])
            
            //Spacer()
            
            // Blank space where the TabBar is
            Spacer()
                .frame(height: 82)
        }
        .background(Color(dataSource.selectedTheme.backgroundColor)
            .ignoresSafeArea())
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: btnBack)
    }
}

struct WordView_Previews: PreviewProvider {
    static var previews: some View {
        WordView(wordFromDictionary: "No se encontró", wordHandURL: "", wordIconURL: "")
            .environmentObject(DataSource())
    }
}
