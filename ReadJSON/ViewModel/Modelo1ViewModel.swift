//
//  Modelo1ViewModel.swift
//  ReadJSON
//
//  Created by Luis Enrique Rosas Espinoza on 03/05/23.
//

import Foundation

class Model1ViewModel: ObservableObject {
    @Published var dataModels: [Model1] = []
    
    init() {
        fetch()
    }
    
    func fetch() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        
        URLSession.shared.dataTask(with: url) {data, response, error in
            guard let dt = data else { return }
            
            do {
                let json = try JSONDecoder().decode([Model1].self, from: dt)
                
                DispatchQueue.main.async {
                    self.dataModels = json
                }
            } catch let error as NSError {
                print("Error", error.localizedDescription)
            }
        }.resume()
    }
}
