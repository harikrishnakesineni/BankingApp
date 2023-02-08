//
//  UserModel.swift
//  BankingApp
//
//  Created by Hari krishna on 17/01/23.
//

import Foundation

@MainActor
class UserModel: ObservableObject {
    let client = HTTPClient()
    
    @Published var token: String = ""
    @Published var user: User = User.defaultUser()
    @Published var isAuthenticated = false
    @Published var users: [User] = []
    @Published var userTypes: [UserType] = []
    
    func login(_ loginRequestBody: LoginRequestBody) async throws {
        let data = try JSONEncoder().encode(loginRequestBody)
        let loginResponse: LoginResponse = try await client.load(Resource(url: URL.authenticateUser, method: .post(data)))
        UserDefaults.standard.set(loginResponse.token, forKey: "token")
        isAuthenticated = true
        token = loginResponse.token
        user = loginResponse.user
        
    }
    
    // MARK: user methods
    
    func getUsers() async throws {
        if let token = UserDefaults.standard.string(forKey: "token") {
            users = try await client.load(Resource(url: URL.getUsers, headers: ["Authorization":"Bearer \(token)"]))
        }
    }
    
    func addUser(_ createUserRequest: CreateUserRequest) async throws {
        
        let data = try JSONEncoder().encode(createUserRequest)
        let user: CreateUserRequest = try await client.load(Resource(url: URL.getUsers, method: .post(data)))
    }
    
    func updateUser(_ user: User) async throws {
        let data = try JSONEncoder().encode(user)
        if let token = UserDefaults.standard.string(forKey: "token") {
            let updateUser: User = try await client.load(Resource(url: URL.updateUser(id: user.id), headers: ["Authorization":"Bearer \(token)"], method: .put(data)))
           
        }
    }
    
    func deleteUser(_ user: User) async throws {
        if let token = UserDefaults.standard.string(forKey: "token") {
            let deleteUser: String = try await client.load(Resource(url: URL.deleteUser(id: user.id), headers: ["Authorization":"Bearer \(token)"], method: .delete))
        }
    }
    
    func logOut() {
        UserDefaults.standard.setValue("", forKey: "token")
        isAuthenticated = false
        token = ""
    }
    
    // MARK: User types
    func getUserTypes() async throws {
        userTypes = try await client.load(Resource(url: URL.getUserTypes))
    }
}
