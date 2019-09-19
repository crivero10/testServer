//
//  ReviewController.swift
//  App
//
//  Created by master on 19/09/19.
//
import Vapor
import FluentMySQL
import Foundation

final class ReviewController {
    /// Returns a list of all `Todo`s.
    func index(_ req: Request) throws -> Future<[Review]> {
        return Review.query(on: req).all()
    }
    
    func indexPopular(_ req: Request) throws -> Future<[Review]> {
        return Review.query(on: req).filter(\Review.username == "testuser").all()
    }

    /// Saves a decoded `Todo` to the database.
    func create(_ req: Request) throws -> Future<Review> {
        return try req.content.decode(Review.self).flatMap { review in
            return review.save(on: req)
        }
    }

    /// Deletes a parameterized `Todo`.
    func delete(_ req: Request) throws -> Future<HTTPStatus> {
        return try req.parameters.next(Review.self).flatMap { review in
            return review.delete(on: req)
        }.transform(to: .ok)
    }
}


