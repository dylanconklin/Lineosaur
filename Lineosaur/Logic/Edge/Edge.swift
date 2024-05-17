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

    internal var copy: Self {
        Self(from: from, toward: toward, weight: weight)
    }

    internal static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.from == rhs.from && lhs.toward == rhs.toward && lhs.weight == rhs.weight
    }

    internal static func < (lhs: Self, rhs: Self) -> Bool {
        lhs.weight < rhs.weight
    }

    internal static func alphabetical() -> (Self, Self) -> Bool {
        { (lhs: Self, rhs: Self) -> Bool in
            var result: Bool = .init(false)
            if lhs.from != rhs.from {
                result = lhs.from < rhs.from
            } else if lhs.toward != rhs.toward {
                result = lhs.toward < rhs.toward
            } else {
                result = lhs.weight < rhs.weight
            }
            return result
        }
    }
}
