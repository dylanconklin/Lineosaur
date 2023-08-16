//
//  MST.swift
//  Adjacency Table
//
//  Created by Dylan Conklin on 7/23/23.
//

import Foundation

func mst(G: Graph) -> Graph {
    var G: Graph = G
    var vertices_left: Set<Vertex> = G.vertices // vertices that don't have an edge
    var MST: Graph = [:]

    while let edge = G.filter({ $0.key.containsAny(in: vertices_left) && $0.key.containsAny(in: MST.vertices) }).sorted(by: { $0.value < $1.value }).first ?? (MST.isEmpty ? G.sorted(by: { $0.value < $1.value }).first : nil) {
        MST.insert(edge: Edge(vertices: edge.key, weight: edge.value))
        for vertex in edge.key {
            vertices_left.remove(vertex)
        }
        G.removeValue(forKey: edge.key)
    }

    return MST
}
