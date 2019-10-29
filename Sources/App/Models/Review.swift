//
//  Review.swift
//  App
//
//  Created by master on 19/09/19.
//

import Foundation
import Vapor
import FluentMySQL

final class Review: MySQLModel{
    var id: Int?
    var username: String
    var text: String
    var movie_id: String
    var score: Int

    /// Creates a new `Todo`.
    init(id: Int? = nil, username: String, text: String, movie_id: String, score: Int) {
        self.id = id
        self.username = username
        self.text = text
        self.movie_id = movie_id
        self.score = score
    }
}


extension Review: Migration { }

/// Allows `Todo` to be encoded to and decoded from HTTP messages.
extension Review: Content { }

/// Allows `Todo` to be used as a dynamic parameter in route definitions.
extension Review: Parameter { }

