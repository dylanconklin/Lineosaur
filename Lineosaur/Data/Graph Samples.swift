//
//  Graph Samples.swift
//  Lineosaur
//
//  Created by Dylan Conklin on 9/20/23.
//

import Foundation

var mixed_int_and_double: Graph {
    let graph: Graph = Graph()

    graph.insert(Edge(from: Vertex(name: "A"), to: Vertex(name: "B"), weight: 1.0))
    graph.insert(Edge(from: Vertex(name: "B"), to: Vertex(name: "C"), weight: 1.5))

    return graph
}

var acyclic_graph: Graph {
    let graph: Graph = Graph()

    graph.insert(Edge(from: Vertex(name: "1"), to: Vertex(name: "2"), weight: 1))
    graph.insert(Edge(from: Vertex(name: "2"), to: Vertex(name: "3"), weight: 1))
    graph.insert(Edge(from: Vertex(name: "2"), to: Vertex(name: "4"), weight: 1))
    graph.insert(Edge(from: Vertex(name: "4"), to: Vertex(name: "5"), weight: 1))
    graph.insert(Edge(from: Vertex(name: "4"), to: Vertex(name: "6"), weight: 1))
    graph.insert(Edge(from: Vertex(name: "5"), to: Vertex(name: "6"), weight: 1))
    graph.insert(Edge(from: Vertex(name: "6"), to: Vertex(name: "3"), weight: 1))

    return graph
}

var cyclic_graph: Graph {
    let graph: Graph = Graph()

    graph.insert(Edge(from: Vertex(name: "1"), to: Vertex(name: "2"), weight: 1))
    graph.insert(Edge(from: Vertex(name: "2"), to: Vertex(name: "3"), weight: 1))
    graph.insert(Edge(from: Vertex(name: "2"), to: Vertex(name: "4"), weight: 1))
    graph.insert(Edge(from: Vertex(name: "4"), to: Vertex(name: "5"), weight: 1))
    graph.insert(Edge(from: Vertex(name: "5"), to: Vertex(name: "6"), weight: 1))
    graph.insert(Edge(from: Vertex(name: "6"), to: Vertex(name: "3"), weight: 1))
    graph.insert(Edge(from: Vertex(name: "6"), to: Vertex(name: "4"), weight: 1))

    return graph
}

var weighted_graph: Graph {
    let graph: Graph = Graph()

    graph.insert(Edge(from: Vertex(name: "a"), to: Vertex(name: "b"), weight: 1))
    graph.insert(Edge(from: Vertex(name: "a"), to: Vertex(name: "c"), weight: 7))
    graph.insert(Edge(from: Vertex(name: "a"), to: Vertex(name: "d"), weight: 22))
    graph.insert(Edge(from: Vertex(name: "b"), to: Vertex(name: "c"), weight: 2))
    graph.insert(Edge(from: Vertex(name: "c"), to: Vertex(name: "f"), weight: 30))
    graph.insert(Edge(from: Vertex(name: "d"), to: Vertex(name: "f"), weight: 11))
    graph.insert(Edge(from: Vertex(name: "d"), to: Vertex(name: "g"), weight: 16))
    graph.insert(Edge(from: Vertex(name: "e"), to: Vertex(name: "f"), weight: 31))
    graph.insert(Edge(from: Vertex(name: "e"), to: Vertex(name: "g"), weight: 6))
    graph.insert(Edge(from: Vertex(name: "f"), to: Vertex(name: "g"), weight: 18))
    graph.insert(Edge(from: Vertex(name: "f"), to: Vertex(name: "h"), weight: 35))
    graph.insert(Edge(from: Vertex(name: "f"), to: Vertex(name: "k"), weight: 28))
    graph.insert(Edge(from: Vertex(name: "h"), to: Vertex(name: "i"), weight: 8))
    graph.insert(Edge(from: Vertex(name: "h"), to: Vertex(name: "j"), weight: 24))
    graph.insert(Edge(from: Vertex(name: "i"), to: Vertex(name: "j"), weight: 13))
    graph.insert(Edge(from: Vertex(name: "j"), to: Vertex(name: "k"), weight: 5))

    return graph
}

var connected_graph: Graph {
    let graph: Graph = Graph()

    graph.insert(Edge(from: Vertex(name: "a"), to: Vertex(name: "b"), weight: 1.0))
    graph.insert(Edge(from: Vertex(name: "b"), to: Vertex(name: "c"), weight: 1.0))
    graph.insert(Edge(from: Vertex(name: "c"), to: Vertex(name: "a"), weight: 1.0))
    graph.insert(Edge(from: Vertex(name: "c"), to: Vertex(name: "d"), weight: 1.0))
    graph.insert(Edge(from: Vertex(name: "d"), to: Vertex(name: "e"), weight: 1.0))
    graph.insert(Edge(from: Vertex(name: "e"), to: Vertex(name: "f"), weight: 1.0))

    return graph
}

var disconnected_graph_no_outlier_vertex: Graph {
    let graph: Graph = Graph()

    graph.insert(Edge(from: Vertex(name: "a"), to: Vertex(name: "b"), weight: 1.0))
    graph.insert(Edge(from: Vertex(name: "b"), to: Vertex(name: "c"), weight: 1.0))
    graph.insert(Edge(from: Vertex(name: "d"), to: Vertex(name: "e"), weight: 1.0))
    graph.insert(Edge(from: Vertex(name: "e"), to: Vertex(name: "f"), weight: 1.0))

    return graph
}

var disconnected_graph_outlier_vertex: Graph {
    let graph: Graph = Graph()

    graph.insert(Edge(from: Vertex(name: "a"), to: Vertex(name: "b"), weight: 1.0))
    graph.insert(Edge(from: Vertex(name: "b"), to: Vertex(name: "c"), weight: 1.0))
    graph.insert(Edge(from: Vertex(name: "c"), to: Vertex(name: "a"), weight: 1.0))
    graph.insert(Edge(from: Vertex(name: "d"), to: Vertex(name: "e"), weight: 1.0))
    graph.insert(Edge(from: Vertex(name: "e"), to: Vertex(name: "f"), weight: 1.0))
    graph.insert(Vertex(name: "z"))

    return graph
}

var bipartite_graph: Graph {
    let graph: Graph = Graph()

    graph.insert(Edge(from: Vertex(name: "a"), to: Vertex(name: "b"), weight: 1.0))
    graph.insert(Edge(from: Vertex(name: "b"), to: Vertex(name: "c"), weight: 1.0))
    graph.insert(Edge(from: Vertex(name: "c"), to: Vertex(name: "d"), weight: 1.0))
    graph.insert(Edge(from: Vertex(name: "d"), to: Vertex(name: "e"), weight: 1.0))
    graph.insert(Edge(from: Vertex(name: "e"), to: Vertex(name: "f"), weight: 1.0))
    graph.insert(Edge(from: Vertex(name: "f"), to: Vertex(name: "a"), weight: 1.0))

    return graph
}

var non_bipartite_graph: Graph {
    let graph: Graph = Graph()

    graph.insert(Edge(from: Vertex(name: "a"), to: Vertex(name: "b"), weight: 1.0))
    graph.insert(Edge(from: Vertex(name: "b"), to: Vertex(name: "c"), weight: 1.0))
    graph.insert(Edge(from: Vertex(name: "c"), to: Vertex(name: "d"), weight: 1.0))
    graph.insert(Edge(from: Vertex(name: "d"), to: Vertex(name: "e"), weight: 1.0))
    graph.insert(Edge(from: Vertex(name: "e"), to: Vertex(name: "a"), weight: 1.0))

    return graph
}

var non_bipartite_graph_with_bipartite_cycle: Graph {
    let graph: Graph = Graph()

    graph.insert(Edge(from: Vertex(name: "a"), to: Vertex(name: "b"), weight: 1.0))
    graph.insert(Edge(from: Vertex(name: "b"), to: Vertex(name: "c"), weight: 1.0))
    graph.insert(Edge(from: Vertex(name: "c"), to: Vertex(name: "d"), weight: 1.0))
    graph.insert(Edge(from: Vertex(name: "d"), to: Vertex(name: "e"), weight: 1.0))
    graph.insert(Edge(from: Vertex(name: "e"), to: Vertex(name: "f"), weight: 1.0))
    graph.insert(Edge(from: Vertex(name: "f"), to: Vertex(name: "a"), weight: 1.0))

    graph.insert(Edge(from: Vertex(name: "v"), to: Vertex(name: "w"), weight: 1.0))
    graph.insert(Edge(from: Vertex(name: "w"), to: Vertex(name: "x"), weight: 1.0))
    graph.insert(Edge(from: Vertex(name: "x"), to: Vertex(name: "y"), weight: 1.0))
    graph.insert(Edge(from: Vertex(name: "y"), to: Vertex(name: "z"), weight: 1.0))
    graph.insert(Edge(from: Vertex(name: "z"), to: Vertex(name: "v"), weight: 1.0))

    return graph
}

var tree_graph: Graph {
    let graph: Graph = Graph()

    graph.insert(Edge(from: Vertex(name: "a"), to: Vertex(name: "b"), weight: 1.0))
    graph.insert(Edge(from: Vertex(name: "a"), to: Vertex(name: "c"), weight: 1.0))
    graph.insert(Edge(from: Vertex(name: "b"), to: Vertex(name: "d"), weight: 1.0))
    graph.insert(Edge(from: Vertex(name: "b"), to: Vertex(name: "e"), weight: 1.0))
    graph.insert(Edge(from: Vertex(name: "c"), to: Vertex(name: "f"), weight: 1.0))
    graph.insert(Edge(from: Vertex(name: "e"), to: Vertex(name: "g"), weight: 1.0))
    graph.insert(Edge(from: Vertex(name: "e"), to: Vertex(name: "h"), weight: 1.0))

    return graph
}

var not_tree_graph: Graph {
    let graph: Graph = Graph()

    graph.insert(Edge(from: Vertex(name: "a"), to: Vertex(name: "b"), weight: 1.0))
    graph.insert(Edge(from: Vertex(name: "a"), to: Vertex(name: "c"), weight: 1.0))
    graph.insert(Edge(from: Vertex(name: "b"), to: Vertex(name: "d"), weight: 1.0))
    graph.insert(Edge(from: Vertex(name: "d"), to: Vertex(name: "h"), weight: 1.0))
    graph.insert(Edge(from: Vertex(name: "h"), to: Vertex(name: "g"), weight: 1.0))
    graph.insert(Edge(from: Vertex(name: "g"), to: Vertex(name: "f"), weight: 1.0))
    graph.insert(Edge(from: Vertex(name: "f"), to: Vertex(name: "e"), weight: 1.0))
    graph.insert(Edge(from: Vertex(name: "e"), to: Vertex(name: "d"), weight: 1.0))

    return graph
}
