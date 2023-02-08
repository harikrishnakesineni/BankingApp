//
//  LoginRequestBody.swift
//  BankingApp
//
//  Created by Hari krishna on 17/01/23.
//

import Foundation

struct LoginRequestBody: Codable {
    let email: String
    let password: String
    
    enum CodingKeys: CodingKey {
        case email
        case password
    }
    
    
}
