//
//  viewModel.swift
//  JohnDeere_iPhone
//
//  Created by MARIO ISAI ROBLES LOZANO on 14/11/22.
//

import Foundation
import SwiftUI

struct Palabra: Hashable, Codable {
    let categoria: String
    let estatus: String
    let id: Int
    let link_draw: String
    let link_icono: String
    let name: String
    let pertenece_A: String
}

class ViewModel: ObservableObject {
    @Published var courses: [Palabra] = []
    
    init(){
        fetch()
    }
    
    func fetch() {
        guard let url = Bundle.main.url(forResource: "coursesData", withExtension: "json") //URL(string: "")
            else {
            print("JSON file not found")
            return
            }
        let data = try? Data(contentsOf: url)
        let courses = try? JSONDecoder().decode([Palabra].self, from: data!)
        self.courses = courses!
    }
}
