//
//  Graph Samples.swift
//  Lineosaur
//
//  Created by Dylan Conklin on 9/20/23.
//

import Foundation

var graph1: Graph {
    let graph: Graph = .init()

    graph.insert(Edge(from: "a", toward: "b", weight: 1))
    graph.insert(Edge(from: "a", toward: "c", weight: 7))
    graph.insert(Edge(from: "a", toward: "d", weight: 22))
    graph.insert(Edge(from: "b", toward: "c", weight: 2))
    graph.insert(Edge(from: "c", toward: "f", weight: 30))
    graph.insert(Edge(from: "d", toward: "f", weight: 11))
    graph.insert(Edge(from: "d", toward: "g", weight: 16))
    graph.insert(Edge(from: "e", toward: "f", weight: 31))
    graph.insert(Edge(from: "e", toward: "g", weight: 6))
    graph.insert(Edge(from: "f", toward: "g", weight: 18))
    graph.insert(Edge(from: "f", toward: "h", weight: 35))
    graph.insert(Edge(from: "f", toward: "k", weight: 28))
    graph.insert(Edge(from: "h", toward: "i", weight: 8))
    graph.insert(Edge(from: "h", toward: "j", weight: 24))
    graph.insert(Edge(from: "i", toward: "j", weight: 13))
    graph.insert(Edge(from: "j", toward: "k", weight: 5))

    return graph
}

var graph2: Graph {
    let graph: Graph = .init()

    graph.insert(Edge(from: "a", toward: "b", weight: 1.0))
    graph.insert(Edge(from: "b", toward: "c", weight: 1.0))
    graph.insert(Edge(from: "c", toward: "a", weight: 1.0))
    graph.insert(Edge(from: "c", toward: "d", weight: 1.0))
    graph.insert(Edge(from: "d", toward: "e", weight: 1.0))
    graph.insert(Edge(from: "e", toward: "f", weight: 1.0))

    return graph
}

var graph3: Graph {
    let graph: Graph = .init()

    graph.insert(Edge(from: "a", toward: "b", weight: 1.0))
    graph.insert(Edge(from: "b", toward: "c", weight: 1.0))
    graph.insert(Edge(from: "d", toward: "e", weight: 1.0))
    graph.insert(Edge(from: "e", toward: "f", weight: 1.0))

    return graph
}
