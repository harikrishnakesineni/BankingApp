//
//  LoginResponse.swift
//  BankingApp
//
//  Created by Hari krishna on 17/01/23.
//

import Foundation

struct LoginResponse: Codable {
    var token: String
    var user: User
}
