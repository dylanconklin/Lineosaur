//
//  Edge.swift
//  Lineosaur
//
//  Created by Dylan Conklin on 9/20/23.
//

import Foundation

struct Edge: Codable, Comparable, CustomStringConvertible, Hashable {
    var from: Vertex
    var toward: Vertex
    var weight: Double
    var id: UUID = .init()

    var description: String {
        "Edge(from: \"\(from)\", to: \"\(toward)\", weight: \(weight)\n"
    }

    /// Returns vertices of the edge
    var vertices: [Vertex] {
        [from, toward]
    }

    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.from == rhs.from && lhs.toward == rhs.toward && lhs.weight == rhs.weight
    }

    static func < (lhs: Self, rhs: Self) -> Bool {
        lhs.weight < rhs.weight
    }
}
