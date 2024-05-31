//
//  Edge.swift
//  Lineosaur
//
//  Created by Dylan Conklin on 9/20/23.
//

import Foundation

internal struct Edge: Codable, Comparable, CustomStringConvertible, Hashable {
    internal var from: Vertex
    internal var toward: Vertex
    internal var weight: Double
    internal var id: UUID = .init()

    internal var description: String {
        "Edge(from: \"\(from)\", to: \"\(toward)\", weight: \(weight)\n"
    }

    /// Returns vertices of the edge
    internal var vertices: [Vertex] {
        [from, toward]
    }

    internal static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.from == rhs.from && lhs.toward == rhs.toward && lhs.weight == rhs.weight
    }

    internal static func < (lhs: Self, rhs: Self) -> Bool {
        lhs.weight < rhs.weight
    }
}
