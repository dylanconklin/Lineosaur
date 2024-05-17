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

    internal static func == (lhs: Edge, rhs: Edge) -> Bool {
        lhs.from == rhs.from && lhs.toward == rhs.toward && lhs.weight == rhs.weight
    }

    internal static func < (lhs: Edge, rhs: Edge) -> Bool {
        lhs.weight < rhs.weight
    }

    internal var description: String {
        "Edge(from: \"\(from)\", to: \"\(toward)\", weight: \(weight)\n"
    }

    internal static func alphabetical() -> (Edge, Edge) -> Bool {
        { (lhs: Edge, rhs: Edge) -> Bool in
            var result: Bool = false
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

    /// Returns vertices of the edge
    internal var vertices: [Vertex] {
        [from, toward]
    }

    internal var copy: Edge {
        Edge(from: from, toward: toward, weight: weight)
    }
}
