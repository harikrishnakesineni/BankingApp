//
//  Date+Extensions.swift
//  BankingApp
//
//  Created by Hari krishna on 20/01/23.
//

import Foundation

extension Date {
    var displayFormat: String {
        self.formatted(.iso8601)
    }
}
