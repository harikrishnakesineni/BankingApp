//
//  EditUserView.swift
//  BankingApp
//
//  Created by Hari krishna on 18/01/23.
//

import SwiftUI

struct EditUserView: View {
    @EnvironmentObject var userModel: UserModel
    @State var user: User
    @State private var errorMessage = ""
    @Environment(\.dismiss) var dismiss
    var body: some View {
        Form {
            TextField("First Name", text: $user.firstName)
            TextField("Last Name", text: $user.lastName)
            TextField("Email", text: $user.email)
            TextField("Password", text: $user.password)
            TextField("Phone", text: $user.phone)
            
            Text(errorMessage)
                .foregroundColor(.red)
            
        }.navigationTitle("Update User")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        updateUser()
                    }
                }
            }
    }
    
    func updateUser() {
        user.dateModified = Date().displayFormat
        user.modifiedBy = user.firstName
        Task {
            do {
               try await userModel.updateUser(user)
                dismiss()
            } catch {
                errorMessage = "Error in updating user"
            }
        }
    }
    
    
    
}

struct EditUserView_Previews: PreviewProvider {
    static var previews: some View {
        EditUserView(user: User.defaultUser())
    }
}
