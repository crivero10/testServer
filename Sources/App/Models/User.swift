//
//  Review.swift
//  App
//
//  Created by master on 19/09/19.
//

import Foundation
import Vapor
import FluentMySQL

final class User: MySQLModel{
    var id: Int?
    var username: String
    var password: String
    
    /// Creates a new `Todo`.
    init(id: Int? = nil, username: String, password: String) {
        self.id = id
        self.username = username
        self.password = password
    }
}


extension User: Migration { }

/// Allows `Todo` to be encoded to and decoded from HTTP messages.
extension User: Content { }

/// Allows `Todo` to be used as a dynamic parameter in route definitions.
extension User: Parameter { }

