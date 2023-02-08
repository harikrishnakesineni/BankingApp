//
//  AddUserView.swift
//  BankingApp
//
//  Created by Hari krishna on 18/01/23.
//

import SwiftUI

struct AddUserView: View {
    
    @EnvironmentObject var userModel: UserModel
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var password = ""
    @State private var phone = ""
    @State private var errorMessage = ""
    @State private var userTypeId = 3
    @State private var selectedUserType: UserType?
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
        Form {
            TextField("Enter First Name", text: $firstName)
            TextField("Enter Last Name", text: $lastName)
            TextField("Enter Email", text: $email)
            SecureField("Enter Password", text: $password)
            TextField("Enter Phone number", text: $phone).keyboardType(.numberPad)
            
            Picker("User Types", selection: $selectedUserType) {
                ForEach(userModel.userTypes, id: \.id) { userType in
                    Text(userType.typeDescription)
                    
                }
            }
            .pickerStyle(.wheel)
            
            Text(errorMessage)
                .foregroundColor(.red)
        }.onAppear {
            getUserTypes()
            selectedUserType = userModel.userTypes.first
        }
        .navigationTitle("Add User")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        addUser()
                    }
                }
            }
    }
    func addUser()   {
        let user = CreateUserRequest(firstName: firstName, lastName: lastName, email: email, password: password, phone: phone, userTypeId: userTypeId, dateCreated: Date().displayFormat, createdBy: firstName, dateModified: "", modifiedBy: "", lastLoginDate: "", isActive: true)
        Task {
            do {
                try await userModel.addUser(user)
                if errorMessage.isEmpty {
                    dismiss()
                }
            } catch {
                errorMessage = "Error in registering a new user"
            }
        }
    }
    
    func getUserTypes() {
        Task {
            do {
                try await userModel.getUserTypes()
            } catch {
                print("Error getting user types")
            }
                
        }
    }
    
}

struct AddUserView_Previews: PreviewProvider {
    static var previews: some View {
        AddUserView()
    }
}
