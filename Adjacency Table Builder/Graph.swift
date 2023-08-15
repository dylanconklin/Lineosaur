//
//  Graph.swift
//  Adjacency Table
//
//  Created by Dylan Conklin on 7/21/23.
//

import Foundation

typealias Vertex = String
typealias Graph = [Set<Vertex> : Double]

struct Edge : Hashable {
    var vertices: Set<Vertex>
    var weight: Double
    
    var verticesArray: [Vertex] {
        get {
            Array(vertices).sorted()
        }
        set {
            self.vertices = Set<Vertex>(newValue)
        }
    }
}

@Observable public class G {
    var G: Graph = [Set(["Baltimore", "Barre"]): 496,
                    Set(["Baltimore", "Portland"]): 2810,
                    Set(["Baltimore", "Richmond"]): 149,
                    Set(["Baltimore", "SLC"]): 2082,
                    Set(["Barre", "Portland"]): 3052,
                    Set(["Barre", "Richmond"]): 646,
                    Set(["Barre", "SLC"]): 2328,
                    Set(["Portland", "Richmond"]): 2867,
                    Set(["Portland", "SLC"]): 768,
                    Set(["Richmond", "SLC"]): 2141,
                    ]
    
    var MST: Graph {
        mst(G: G)
    }
}

extension Graph {
    mutating func setSelf (to vals: [Edge]) -> [Set<String> : Double] {
        var result: [Set<String> : Double] = [:]
        for val in vals {
            result[val.vertices] = val.weight
        }
        return result
    }
    
    var vertices: Set<Vertex> {
        var vertices: Set<Vertex> = []
        self.forEach { edge in
            vertices.formUnion(edge.key)
        }
        return vertices
    }
    
    var verticesArray: [Vertex] {
        Array(self.vertices).sorted()
    }
    
    var edges: Set<Edge> {
        var edges: Set<Edge> = []
        self.vertices.forEach { v1 in
            self.vertices.forEach { v2 in
                if self[Set([v1, v2])] != nil {
                    edges.insert(Edge(vertices: Set([v1, v2]), weight: self[Set([v1, v2])] ?? 0.0))
                }
            }
        }
        return edges
    }
    
    var edgesArray: [Edge] {
        get {
            Array(self.edges).sorted(by: {
                let index: Int = $0.verticesArray[0] != $1.verticesArray[0] ? 0 : 1
                return $0.verticesArray[index] < $1.verticesArray[index]
            })
        }
        set {
            self = setSelf(to: newValue)
        }
    }
}

extension Set {
    func containsAny(in set: Set) -> Bool {
        var result: Bool = false
        for element in set {
            if contains(element) {
                result = true
            }
        }
        return result
    }
}
