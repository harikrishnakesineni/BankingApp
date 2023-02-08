//
//  UserListView.swift
//  BankingApp
//
//  Created by Hari krishna on 18/01/23.
//

import SwiftUI

struct UserListView: View {
    @EnvironmentObject var userModel: UserModel
    @State private var errorMessage = ""
    @State private var isDownloading = false
    @State private var downloadProgress: Float = 0.0
    
    var body: some View {
//        NavigationView {
            List {
                ForEach(userModel.users, id: \.id) { user in
                    NavigationLink(destination: UserDetailView(user: user)) {
                        HStack {
                            Text("\(user.firstName), \(user.lastName)")
                        }
                        Spacer()
                     
                    }
                    
                }
                .onDelete { indexSet in
                    deleteUser(at: indexSet)
                }
            }.navigationTitle("Users")
                .toolbar {
                    EditButton()
                }
                .task {
                    await getUsers()
                }
        if isDownloading {
            ProgressView(value: downloadProgress)
        }
    }
    func getUsers() async {
        isDownloading = true
        defer {
            isDownloading = false
        }
        do {
            try await userModel.getUsers()
        } catch {
            errorMessage = "Error getting users"
        }
    }
    
    func deleteUser(at offsets: IndexSet) {
        for index in offsets {
            let user = userModel.users[index]
            Task {
                do {
                    try await userModel.deleteUser(user)
                } catch {
                    errorMessage = "Error deleting user"
                }
            }
        }
    }
    
}


struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
    }
}
