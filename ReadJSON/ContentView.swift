//
//  ContentView.swift
//  ReadJSON
//
//  Created by Luis Enrique Rosas Espinoza on 02/05/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var loginViewModel: LoginViewModel
    
    var body: some View {
        switch loginViewModel.authenticated {
        case 0:
            LoginView()
        case 1:
            Home2View()
        case 2:
            ErrorView()
        default:
            ErrorView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(LoginViewModel())
    }
}
