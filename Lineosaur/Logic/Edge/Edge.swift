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

    static func == (lhs: Edge, rhs: Edge) -> Bool {
        return lhs.from == rhs.from && lhs.toward == rhs.toward && lhs.weight == rhs.weight
    }

    static func < (lhs: Edge, rhs: Edge) -> Bool {
        lhs.weight < rhs.weight
    }

    var description: String {
        return "Edge(from: \"\(from)\", to: \"\(toward)\", weight: \(weight)\n"
    }

    static func alphabetical() -> (Edge, Edge) -> Bool {
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
    var vertices: [Vertex] {
        get {
            [from, toward]
        }
        set {
            guard newValue.count == 2 else {
                return
            }
            from = newValue[0]
            toward = newValue[1]
        }
    }

    var copy: Edge {
        Edge(from: from, toward: toward, weight: weight)
    }
}
