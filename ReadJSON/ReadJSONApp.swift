//
//  ReadJSONApp.swift
//  ReadJSON
//
//  Created by Luis Enrique Rosas Espinoza on 02/05/23.
//

import SwiftUI

@main
struct ReadJSONApp: App {
    let loginViewModel = LoginViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(loginViewModel)
        }
    }
}
