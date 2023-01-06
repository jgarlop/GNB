//
//  NetworkClient.swift
//  GNB
//
//  Created by Javier Garcia on 4/1/23.
//

import Foundation

protocol Networking {
    func request<T: Decodable>(operation: BaseOperation, type: T.Type) async throws -> T
}

enum NetworkError: Error {
    case apiUrlNotFound
    case noResponse
    case invalidResponse
    case unknown(error: Error)
}

struct NetworkClient: Networking {
    let apiURL: URL
    let decoder: JSONDecoder = JSONDecoder()

    func request<T: Decodable>(operation: BaseOperation, type: T.Type) async throws -> T {
        try await URLSession.shared.request(operation: operation, type: type)
    }
}


private extension URLSession {
    func request<T: Decodable>(operation: BaseOperation, type: T.Type) async throws -> T {
        guard let apiStringUrl = try? String.infoPlistValue(for: .apiUrl),
              let apiURL = URL(string: apiStringUrl + operation.endpoint.path)
        else {
            throw NetworkError.apiUrlNotFound
        }

        var request = URLRequest(url: apiURL)
        request.setValue(operation.mimeType.rawValue, forHTTPHeaderField: "Accept")

        guard let (data, response) = try? await URLSession.shared.data(for: request) else {
            throw NetworkError.noResponse
        }

        guard let httpResponse = response as? HTTPURLResponse,
              (200..<300).contains(httpResponse.statusCode)
        else {
            throw NetworkError.invalidResponse
        }

        return try operation.decode(from: data, to: T.self)
    }
}
