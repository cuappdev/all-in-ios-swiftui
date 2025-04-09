//
//  ApiClient.swift
//  All In
//
//  Created by Peter Bidoshi on 4/9/25.
//

import Foundation

protocol APIClient {

    func get<T: Decodable>(url: URL) async throws -> T

    func post<T: Decodable, U: Encodable>(url: URL, body: U) async throws -> T

    func delete(url: URL) async throws

}
