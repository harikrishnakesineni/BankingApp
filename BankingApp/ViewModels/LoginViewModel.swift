//
//  LoginViewModel.swift
//  BankingApp
//
//  Created by Hari krishna on 07/12/22.
//

import Foundation

class LoginViewModel: ObservableObject {
    func isLoginValid(username: String, password: String) -> Bool {
        return username == "Hari" || password == "Password" ? true : false
    }
    
}
