//
//  BankingAppApp.swift
//  BankingApp
//
//  Created by Hari krishna on 03/12/22.
//

import SwiftUI

@main
struct BankingAppApp: App {
    var body: some Scene {
        WindowGroup {
            MainView(loginViewModel: LoginViewModel())
        }
    }
}
