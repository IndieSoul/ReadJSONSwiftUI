//
//  PostViewModel.swift
//  ReadJSON
//
//  Created by Luis Enrique Rosas Espinoza on 02/05/23.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var authenticated = 0
    
    init() {
        if let session = UserDefaults.standard.object(forKey: "authenticated") as? Int {
            authenticated = session
        } else {
            authenticated = 0
        }
    }
    
    func login(email: String, password: String) {
        guard let url = URL(string: "https://reqres.in/api/login") else { return }
        
        let parameters = ["email": email, "password": password]
        let body = try! JSONSerialization.data(withJSONObject: parameters)
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        request.httpBody = body
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) {data, response, error in
            if let resp = response {
                print(resp)
            }
            
            guard let dt = data else { return }
            
            do {
                let dateDecoded = try JSONDecoder().decode(PostModel.self, from: dt)
                
                if !dateDecoded.token.isEmpty {
                    DispatchQueue.main.async {
                        self.authenticated = 1
                        UserDefaults.standard.setValue(self.authenticated, forKey: "authenticated")
                    }
                }
            } catch let error as NSError {
                print("Error", error.localizedDescription)
                DispatchQueue.main.async {
                    self.authenticated = 2
                }
            }
        }.resume()
    }
}
