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
    case noResponse
    case invalidResponse
    case unknown(error: Error)
}

struct NetworkClient: Networking {
    let apiURL: URL
    let decoder: JSONDecoder = JSONDecoder()

    func request<T: Decodable>(operation: BaseOperation, type: T.Type) async throws -> T {
        let url = apiURL.appendingPathComponent(operation.endpoint.path)
        return try await URLSession.shared.request(operation: operation, type: type, url: url)
    }
}


private extension URLSession {
    func request<T: Decodable>(operation: BaseOperation, type: T.Type, url: URL) async throws -> T {
        var request = URLRequest(url: url)
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
