//
//  Kruskal.swift
//  Adjacency Table
//
//  Created by Dylan Conklin on 7/23/23.
//

import Foundation

func kruskal(G: Graph, vertices: Set<Vertex>) -> Graph {
    var G: Graph = G
    var vertices_left: Set<Vertex> = Set<Vertex>(vertices) // vertices that don't have an edge
    var MST: Graph = [:]

    for edge in G.sorted(by: { $0.value < $1.value }) {
        if vertices_left.containsAny(in: edge.key) {
            MST[edge.key] = edge.value
            for vertex in edge.key {
                vertices_left.remove(vertex)
            }
        }
        G.removeValue(forKey: edge.key)
    }
    return MST
}
