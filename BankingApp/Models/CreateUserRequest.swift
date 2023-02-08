//
//  CreateUserRequest.swift
//  BankingApp
//
//  Created by Hari krishna on 20/01/23.
//

import Foundation

struct CreateUserRequest: Codable, Hashable {
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
