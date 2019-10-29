//
//  ReviewController.swift
//  App
//
//  Created by master on 19/09/19.
//
import Vapor
import FluentMySQL
import Foundation

final class UserController {
    /// Returns a list of all `Todo`s.
    func index(_ req: Request) throws -> Future<[User]> {
        return User.query(on: req).all()
    }
    
    /// Saves a decoded `Todo` to the database.
    func create(_ req: Request) throws -> Future<User> {
        return try req.content.decode(User.self).flatMap { review in
            return review.save(on: req)
        }
    }

    /// Deletes a parameterized `Todo`.
    func delete(_ req: Request) throws -> Future<HTTPStatus> {
        return try req.parameters.next(User.self).flatMap { review in
            return review.delete(on: req)
        }.transform(to: .ok)
    }
}


