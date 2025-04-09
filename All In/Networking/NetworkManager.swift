//
//  NetworkManager.swift
//  All In
//
//  Created by Peter Bidoshi on 4/21/24.
//

//
//  NetworkManager.swift
//  Resell
//
//  Created by Richie Sun on 11/2/24.
//

import Combine
import Foundation
import os

class NetworkManager: APIClient {

    // MARK: - Singleton Instance

    static let shared = NetworkManager()

    // MARK: - Error Logger for Networking

    let logger = Logger(subsystem: Bundle.main.bundleIdentifier ?? "com.cornellappdev.Resell", category: #file)

    // MARK: - Properties

    private let hostURL: String = Keys.serverURL

    // MARK: - Init

    private init() { }

    // MARK: - Template Helper Functions

    /// Template function to FETCH data from URL and decodes it into a specified type `T`,
    ///
    /// The function fetches data from the network, verifies the
    /// HTTP status code, caches the response, decodes the data, and then returns it as a decoded model.
    ///
    /// - Parameter url: The URL from which data should be fetched.
    /// - Returns: A publisher that emits a decoded instance of type `T` or an error if the decoding or network request fails.
    ///
    func get<T: Decodable>(url: URL) async throws -> T {
        let request = try createRequest(url: url, method: "GET")

        let (data, response) = try await URLSession.shared.data(for: request)

        try handleResponse(data: data, response: response)

        return try JSONDecoder().decode(T.self, from: data)
    }

    /// Template function to POST data to a specified URL with an encodable body and decodes the response into a specified type `T`.
    ///
    /// This function takes a URL and a request body, encodes the body as JSON, and sends it as part of
    /// a POST request to the given URL. It then receives the response, checks the HTTP status code, and
    /// decodes the response data into a specified type. This function is useful for sending data to a server
    /// and processing the server's JSON response.
    ///
    /// - Parameters:
    ///   - url: The URL to which the POST request will be sent.
    ///   - body: The data to be sent in the request body, which must conform to `Encodable`.
    /// - Returns: A publisher that emits a decoded instance of type `T` or an error if the decoding or network request fails.
    ///
    func post<T: Decodable, U: Encodable>(url: URL, body: U) async throws -> T {
        let requestData = try JSONEncoder().encode(body)
        let request = try createRequest(url: url, method: "POST", body: requestData)

        let (data, response) = try await URLSession.shared.data(for: request)

        try handleResponse(data: data, response: response)

        return try JSONDecoder().decode(T.self, from: data)
    }

    /// Overloaded post function for requests without a return
    func post<U: Encodable>(url: URL, body: U) async throws {
        let requestData = try JSONEncoder().encode(body)
        let request = try createRequest(url: url, method: "POST", body: requestData)

        let (data, response) = try await URLSession.shared.data(for: request)

        try handleResponse(data: data, response: response)
    }

    /// Overloaded post function for requests without a body
    func post<T: Decodable>(url: URL) async throws -> T {
        let request = try createRequest(url: url, method: "POST")

        let (data, response) = try await URLSession.shared.data(for: request)

        try handleResponse(data: data, response: response)

        return try JSONDecoder().decode(T.self, from: data)
    }

    /// Template function to DELETE data to a specified URL with an encodable body and decodes the response into a specified type `T`.
    func delete(url: URL) async throws {
        let request = try createRequest(url: url, method: "DELETE")

        let (data, response) = try await URLSession.shared.data(for: request)

        try handleResponse(data: data, response: response)
    }

    private func createRequest(url: URL, method: String, body: Data? = nil) throws -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        if let accessToken = GoogleAuthManager.shared.accessToken {
            request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        }

        request.httpBody = body
        return request
    }

    private func constructURL(endpoint: String) throws -> URL {
        guard let url = URL(string: "\(hostURL)\(endpoint)") else {
            logger.error("Failed to construct URL for endpoint: \(endpoint)")
            throw URLError(.badURL)
        }

        return url
    }

    private func handleResponse(data: Data, response: URLResponse) throws {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }

        if httpResponse.statusCode != 200 {
            if let errorResponse = try? JSONDecoder().decode(ErrorResponse.self, from: data) {
                throw errorResponse
            } else {
                throw URLError(.init(rawValue: httpResponse.statusCode))
            }
        }
    }

    // MARK: - Auth Networking Functions

    func authorize() async throws -> AuthorizeResponse? {
        let url = try constructURL(endpoint: "/auth/")

        return try await post(url: url)
    }

    // MARK: - User Networking Functions

    // MARK: - Post Networking Functions

    // MARK: - Request Networking Functions

    // MARK: - Feedback Networking Functions

    // MARK: - Reporting Networking Functions

    // MARK: - Chat Networking Functions

    // MARK: - Other Networking Functions

}
