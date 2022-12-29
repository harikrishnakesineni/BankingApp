//
//  LoginView.swift
//  BankingApp
//
//  Created by Hari krishna on 07/12/22.
//

import SwiftUI

struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    @ObservedObject var loginViewModel: LoginViewModel
    
    var body: some View {
        VStack {
            TextField("Enter username", text: $username)
            
            SecureField("Enter password", text: $password)
            
            Button {
                if loginViewModel.isLoginValid(username: username, password: password) {
                    Text("Welcome Hari")
                    UserDefaults.standard.set("Hari", forKey: "setLogin")
                } else {
                    Text("Login Failed")
                }
            } label: {
                Text("Login")
            }

            
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(loginViewModel: LoginViewModel())
    }
}
