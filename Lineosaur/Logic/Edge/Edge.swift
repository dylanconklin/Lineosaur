//
//  Edge.swift
//  Lineosaur
//
//  Created by Dylan Conklin on 9/20/23.
//

import Foundation

struct Edge: Codable, Comparable, CustomStringConvertible, Hashable {
    var from: Vertex
    var to: Vertex
    var weight: Double
    var id: UUID = UUID()

    static func == (lhs: Edge, rhs: Edge) -> Bool {
        return lhs.from == rhs.from && lhs.to == rhs.to && lhs.weight == rhs.weight
    }

    static func < (lhs: Edge, rhs: Edge) -> Bool {
        lhs.weight < rhs.weight
    }
    
    var description: String {
        return "Edge(from: \"\(self.from)\", to: \"\(self.to)\", weight: \(self.weight)\n"
    }

    static func alphabetical() -> (Edge, Edge) -> Bool {
        { (lhs: Edge, rhs: Edge) -> Bool in
            var result: Bool = false
            if lhs.from != rhs.from {
                result = lhs.from < rhs.from
            } else if lhs.to != rhs.to {
                result = lhs.to < rhs.to
            } else {
                result = lhs.weight < rhs.weight
            }
            return result
        }
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

    var copy: Edge {
        Edge(from: self.from, to: self.to, weight: self.weight)
    }
}
