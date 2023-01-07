//
//  Operation.swift
//  GNB
//
//  Created by Javier Garcia on 4/1/23.
//

import Foundation

protocol BaseOperation {
    var endpoint: Endpoint { get }
    var mimeType: MimeType { get }
    var httpMethod: HttpMethod { get }
    var decoder: Decoder { get }

    func decode<T: Decodable>(from data: Data, to type: T.Type) throws -> T
}

extension BaseOperation {
    func decode<T: Decodable>(from data: Data, to type: T.Type) throws -> T {
        try decoder.decode(type, from: data)
    }
}

struct JSONOperation: BaseOperation {
    let httpMethod: HttpMethod
    let endpoint: Endpoint
    let decoder: Decoder = JSONDecoder()
    let mimeType: MimeType = .json
}
