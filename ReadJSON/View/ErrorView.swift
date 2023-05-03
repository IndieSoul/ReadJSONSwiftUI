//
//  ErrorView.swift
//  ReadJSON
//
//  Created by Luis Enrique Rosas Espinoza on 02/05/23.
//

import SwiftUI

struct ErrorView: View {
    @EnvironmentObject var loginViewModel: LoginViewModel
    
    var body: some View {
        VStack {
            Text("Error")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            Button("Back to login") {
                loginViewModel.authenticated = 0
            }
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView()
            .environmentObject(LoginViewModel())
    }
}
