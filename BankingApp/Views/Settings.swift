//
//  Settings.swift
//  BankingApp
//
//  Created by Hari krishna on 03/12/22.
//

import SwiftUI

struct Settings: View {
    @ObservedObject var loginViewModel: LoginViewModel
    @State var setLogin = UserDefaults.standard.string(forKey: "setLogin")
    var body: some View {
        NavigationView {
            Form {
//                guard let setLogin = setLogin else { }
                if let setLogin = setLogin {
                    Text("\(setLogin)")
                } else {
                    Section {
                        
//                        if setLogin.isEmpty {
                            NavigationLink(destination: LoginView(loginViewModel: loginViewModel)) {
                                
                            }
//                        }
                    } header: {
                        Text("Login Details")
                    }
                    
                }
                
                    
                    Section {
                        
                    } header: {
                        Text("Notificaitons")
                    }
                    
                    
                    
                
            }
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings(loginViewModel: LoginViewModel())
    }
}
