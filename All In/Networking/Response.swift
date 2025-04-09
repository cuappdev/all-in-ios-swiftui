//
//  Response.swift
//  All In
//
//  Created by Peter Bidoshi on 4/9/25.
//

import Foundation

// MARK: - Auth

struct AuthorizeResponse: Decodable {
    let user: User
}

// MARK: - Error Responses

struct ErrorResponse: Codable, Error, Equatable, LocalizedError {
    let error: String
    let httpCode: Int

    var errorDescription: String? {
        error
    }
}
