//
//  HomeView.swift
//  ReadJSON
//
//  Created by Luis Enrique Rosas Espinoza on 02/05/23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var loginViewModel: LoginViewModel
    @StateObject var model1ViewModel = Model1ViewModel()
    
    var body: some View {
        NavigationView {
            if model1ViewModel.dataModels.isEmpty {
                ProgressView()
            } else {
                List(model1ViewModel.dataModels, id: \.id) { item in
                    VStack {
                        Text(item.name)
                        Text(item.address.geo.lat)
                    }
                }
                .navigationTitle("Read JSON")
                .toolbar {
                    ToolbarItem {
                        Button("Logout") {
                            loginViewModel.authenticated = 0
                            UserDefaults.standard.setValue(loginViewModel.authenticated, forKey: "authenticated")
                        }
                    }
                }
            }
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
