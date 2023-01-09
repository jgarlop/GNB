//
//  Decoder.swift
//  GNB
//
//  Created by Javier Garcia on 6/1/23.
//

import Foundation

protocol Decoder {
    func decode<T: Decodable>(_ type: T.Type, from data: Data) throws -> T
}

enum DecoderError: Error {
    case couldNotParse
}
