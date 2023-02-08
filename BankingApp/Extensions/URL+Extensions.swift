//
//  URL+Extensions.swift
//  BankingApp
//
//  Created by Hari krishna on 12/01/23.
//

import Foundation

extension URL {
    static var development: URL {
        URL(string: "https://lvstechwebapi.azurewebsites.net/")!
    }
    
    static var production: URL {
        URL(string: "https://lvstechwebapi.azurewebsites.net/")!
    }
    
    static var baseUrl: URL {
        #if DEBUG
        return development
        #else
        return production
        #endif
    }
    
    // MARK: Get all user methods
    static var authenticateUser: URL {
        return URL(string: "api/authentication/authenticate", relativeTo: Self.baseUrl)!
    }
    
    static var getUsers: URL {
        return URL(string: "api/users", relativeTo: Self.baseUrl)!
    }
    
    static var addUser: URL {
        return URL(string: "api/users", relativeTo: Self.baseUrl)!
    }
    
    static func updateUser(id: Int) -> URL {
        return URL(string: "api/users/\(id)", relativeTo: Self.baseUrl)!
    }
    
    static func deleteUser(id: Int) -> URL {
        return URL(string: "api/users/\(id)", relativeTo: Self.baseUrl)!
    }
    
    // MARK: Get all user types
    static var getUserTypes: URL {
        return URL(string: "api/usertypes", relativeTo: Self.baseUrl)!
    }

}
