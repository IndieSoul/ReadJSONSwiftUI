//
//  LoginView.swift
//  ReadJSON
//
//  Created by Luis Enrique Rosas Espinoza on 02/05/23.
//

import SwiftUI

struct LoginView: View {
    @State var email = ""
    @State var password = ""
    
    @EnvironmentObject var loginViewModel: LoginViewModel
    
    var body: some View {
        VStack {
            Spacer()
            VStack {
                Image(systemName: "key.fill")
                    .resizable()
                    .frame(width: 50, height: 90)
                Text("WELCOME")
                    .font(.title)
                    .fontWeight(.bold)
            }
            Spacer()
            VStack {
                Text("Email:")
                TextField("Email", text: $email)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.emailAddress)
                Text("Password:")
                SecureField("Password", text: $password)
                    .textFieldStyle(.roundedBorder)
            }
            Spacer()
            Button("Login") {
                loginViewModel.login(email: email, password: password)
            }
            Spacer()
        }
        .padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
