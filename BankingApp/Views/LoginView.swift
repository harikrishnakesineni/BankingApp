//
//  LoginView.swift
//  BankingApp
//
//  Created by Hari krishna on 07/12/22.
//

import SwiftUI

struct LoginView: View {
    @State private var email = "suneetha_n@hotmail.com"
    @State private var password = "suneetha"
    @State private var errorMessage = ""
    @EnvironmentObject private var userModel: UserModel
    @Environment (\.dismiss) private var dismiss
    @State private var isUserAddPresented = false
    
    var isFormNotValid: Bool {
        email.isEmpty || password.isEmpty
        
    }
    
    func login() {
        let loginRequestBody = LoginRequestBody(email: email, password: password)
        Task {
            do {
                try await userModel.login(loginRequestBody)
                if errorMessage.isEmpty {
                    dismiss()
                }
            } catch {
                errorMessage = "Invalid Login"
            }
        }
    }
    
    var body: some View {
        VStack {
            TextField("Enter username", text: $email)
            
            SecureField("Enter password", text: $password)
            
            Text(errorMessage)
            Button {
                if !isFormNotValid {
                    login()
                }
                
                
            } label: {
                Text("Login")
            }.disabled(isFormNotValid)
           
            
        }.padding()
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isUserAddPresented = true
                    } label: {
                        Text("Register")
                    }

                    }
                }
            .sheet(isPresented: $isUserAddPresented) {
                NavigationStack {
                    AddUserView()
                }
            }
            }
        
    }


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
