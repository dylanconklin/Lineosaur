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
    var G: Graph = [Set(["1", "2"]): 1.5,
                    Set(["4", "3"]): 4.5,
                    Set(["3", "2"]): 2.3,
                    Set(["3", "1"]): 2.5,
                    Set(["2", "5"]): 3.5,
                    Set(["5", "1"]): 1.3,
                    Set(["2", "4"]): 2.4,
                    Set(["4", "5"]): 2.3,
                    Set(["4", "1"]): 1.4,
                    Set(["3", "5"]): 2.5]
    
    var MST: Graph {
        kruskal(G: G)
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
