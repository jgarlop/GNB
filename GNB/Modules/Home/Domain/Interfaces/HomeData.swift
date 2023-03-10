//
//  HomeRepository.swift
//  GNB
//
//  Created by Javier Garcia on 7/1/23.
//

import Foundation

protocol HomeData {
    func getProducts() async throws -> [Product]
}
