//
//  Edge.swift
//  Adjacency Table Builder
//
//  Created by Dylan Conklin on 9/20/23.
//

import Foundation

struct Edge: Hashable, Comparable {
    var from: Vertex
    var to: Vertex
    var weight: Double

    static func < (lhs: Edge, rhs: Edge) -> Bool {
        lhs.weight < rhs.weight
    }

    /// Returns vertices of the edge
    var vertices: [Vertex] {
        get {
            [from, to]
        }
        set {
            guard newValue.count == 2 else {
                return
            }
            from = newValue[0]
            to = newValue[1]
        }
    }

    var isVertex: Bool {
        to == from && weight == 0
    }
}
