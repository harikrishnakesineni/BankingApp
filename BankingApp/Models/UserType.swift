//
//  UserType.swift
//  BankingApp
//
//  Created by Hari krishna on 31/01/23.
//

import Foundation

struct UserType: Codable, Hashable {
    let id: Int
    let typeDescription: String
    let isActive: Bool
}
