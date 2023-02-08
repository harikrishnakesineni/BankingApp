//
//  User.swift
//  BankingApp
//
//  Created by Hari krishna on 17/01/23.
//

import Foundation

struct User: Codable, Hashable {
    var id: Int
    var firstName: String
    var lastName: String
    var email: String
    var password: String
    var phone: String
    var userTypeId: Int
    var dateCreated: String
    var createdBy: String
    var dateModified: String?
    var modifiedBy: String?
    var lastLoginDate: String?
    var isActive: Bool
}

extension User {
    static func defaultUser() -> User {
        let user = User(id: 0, firstName: "", lastName: "", email: "", password: "", phone: "", userTypeId: 3, dateCreated: "", createdBy: "", dateModified: "", modifiedBy: "", lastLoginDate: "", isActive: false)
        return user
    }
}
