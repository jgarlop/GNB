//
//  ExchangeFinder.swift
//  GNB
//
//  Created by Javier Garcia on 8/1/23.
//

import Foundation

protocol ExchangeRateFindable {
    var exchangeRates: [ExchangeRate] { get set }
    func convert(originCurrency: String, to: String, quantity: Decimal) -> Decimal?
}

final class Node {
    var parent: Node? = nil
    let value: String
    var destinations: [String] = []

    init(parent: Node? = nil, value: String, destinations: [String] = []) {
        self.parent = parent
        self.value = value
        self.destinations = destinations
    }

    func addChild(_ node: String) {
        destinations.append(node)
    }
}

final class ExchangeRateFinder: ExchangeRateFindable {
    var exchangeRates: [ExchangeRate]

    init(exchangeRates: [ExchangeRate]) {
        self.exchangeRates = exchangeRates
    }

    func convert(originCurrency: String, to destination: String, quantity: Decimal) -> Decimal? {
        let path = findPath(origin: originCurrency, destination: destination)

        // Exit if path was not found
        guard !path.isEmpty else { return nil }

        var accumulated: Decimal = quantity

        for (index, currency) in path.enumerated() {
            if let destination = path[safe: index + 1],
               let exchangeRate = exchangeRates
                   .filter({ $0.origin == currency && $0.destination == destination })
                   .first?
                .rate
            {
                accumulated *= exchangeRate
            }
        }

        return accumulated
    }

    func findPath(origin: String, destination: String) -> [String] {
        var path: [String] = []
        var currenciesToVisit: [Node] = [buildCurrencyNode(for: origin)]
        var visited: [String] = []

        while !currenciesToVisit.isEmpty {
            let currentElement = currenciesToVisit.remove(at: 0)
            visited.append(currentElement.value)

            // Check if children of current element have the possible destination
            if let result = currentElement.destinations.first(where: { $0 == destination }) {
                var parent: Node? = currentElement.parent
                var parents: [String] = []
                while let currentParent = parent {
                    parents.append(currentParent.value)
                    parent = currentParent.parent
                }

                while !parents.isEmpty {
                    path.append(parents.removeLast())
                }

                path.append(currentElement.value)
                path.append(result)
                break
            }

            // If no destinanation was found,
            // add the children as elements to visit, removing already visited
            currenciesToVisit.append(
                contentsOf: currentElement.destinations
                    .filter { !visited.contains($0) }
                    .map { buildCurrencyNode(parent: currentElement, for: $0)}
            )
        }

        return path
    }

    func buildCurrencyNode(parent: Node? = nil, for currency: String) -> Node {
        let destinations = exchangeRates
            .filter { $0.origin == currency }
            .map(\.destination)
        return Node(parent: parent, value: currency, destinations: destinations)
    }
}
