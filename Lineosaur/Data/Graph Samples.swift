//
//  Graph Samples.swift
//  Lineosaur
//
//  Created by Dylan Conklin on 9/20/23.
//

import Foundation

var mixedIntAndDouble: Graph {
    let graph = Graph()

    graph.insert(Edge(from: "A", to: "B", weight: 1.0))
    graph.insert(Edge(from: "B", to: "C", weight: 1.5))

    return graph
}

var acyclicGraph: Graph {
    let graph = Graph()

    graph.insert(Edge(from: "1", to: "2", weight: 1))
    graph.insert(Edge(from: "2", to: "3", weight: 1))
    graph.insert(Edge(from: "2", to: "4", weight: 1))
    graph.insert(Edge(from: "4", to: "5", weight: 1))
    graph.insert(Edge(from: "4", to: "6", weight: 1))
    graph.insert(Edge(from: "5", to: "6", weight: 1))
    graph.insert(Edge(from: "6", to: "3", weight: 1))

    return graph
}

var cyclicGraph: Graph {
    let graph = Graph()

    graph.insert(Edge(from: "1", to: "2", weight: 1))
    graph.insert(Edge(from: "2", to: "3", weight: 1))
    graph.insert(Edge(from: "2", to: "4", weight: 1))
    graph.insert(Edge(from: "4", to: "5", weight: 1))
    graph.insert(Edge(from: "5", to: "6", weight: 1))
    graph.insert(Edge(from: "6", to: "3", weight: 1))
    graph.insert(Edge(from: "6", to: "4", weight: 1))

    return graph
}

var weightedGraph: Graph {
    let graph = Graph()

    graph.insert(Edge(from: "a", to: "b", weight: 1))
    graph.insert(Edge(from: "a", to: "c", weight: 7))
    graph.insert(Edge(from: "a", to: "d", weight: 22))
    graph.insert(Edge(from: "b", to: "c", weight: 2))
    graph.insert(Edge(from: "c", to: "f", weight: 30))
    graph.insert(Edge(from: "d", to: "f", weight: 11))
    graph.insert(Edge(from: "d", to: "g", weight: 16))
    graph.insert(Edge(from: "e", to: "f", weight: 31))
    graph.insert(Edge(from: "e", to: "g", weight: 6))
    graph.insert(Edge(from: "f", to: "g", weight: 18))
    graph.insert(Edge(from: "f", to: "h", weight: 35))
    graph.insert(Edge(from: "f", to: "k", weight: 28))
    graph.insert(Edge(from: "h", to: "i", weight: 8))
    graph.insert(Edge(from: "h", to: "j", weight: 24))
    graph.insert(Edge(from: "i", to: "j", weight: 13))
    graph.insert(Edge(from: "j", to: "k", weight: 5))

    return graph
}

var connectedGraph: Graph {
    let graph = Graph()

    graph.insert(Edge(from: "a", to: "b", weight: 1.0))
    graph.insert(Edge(from: "b", to: "c", weight: 1.0))
    graph.insert(Edge(from: "c", to: "a", weight: 1.0))
    graph.insert(Edge(from: "c", to: "d", weight: 1.0))
    graph.insert(Edge(from: "d", to: "e", weight: 1.0))
    graph.insert(Edge(from: "e", to: "f", weight: 1.0))

    return graph
}

var disconnectedGraphNoOutlierVertex: Graph {
    let graph = Graph()

    graph.insert(Edge(from: "a", to: "b", weight: 1.0))
    graph.insert(Edge(from: "b", to: "c", weight: 1.0))
    graph.insert(Edge(from: "d", to: "e", weight: 1.0))
    graph.insert(Edge(from: "e", to: "f", weight: 1.0))

    return graph
}

var disconnectedGraphOutlierVertex: Graph {
    let graph = Graph()

    graph.insert(Edge(from: "a", to: "b", weight: 1.0))
    graph.insert(Edge(from: "b", to: "c", weight: 1.0))
    graph.insert(Edge(from: "c", to: "a", weight: 1.0))
    graph.insert(Edge(from: "d", to: "e", weight: 1.0))
    graph.insert(Edge(from: "e", to: "f", weight: 1.0))
    graph.insert("z")

    return graph
}

var bipartiteGraph: Graph {
    let graph = Graph()

    graph.insert(Edge(from: "a", to: "b", weight: 1.0))
    graph.insert(Edge(from: "b", to: "c", weight: 1.0))
    graph.insert(Edge(from: "c", to: "d", weight: 1.0))
    graph.insert(Edge(from: "d", to: "e", weight: 1.0))
    graph.insert(Edge(from: "e", to: "f", weight: 1.0))
    graph.insert(Edge(from: "f", to: "a", weight: 1.0))

    return graph
}

var nonBipartiteGraph: Graph {
    let graph = Graph()

    graph.insert(Edge(from: "a", to: "b", weight: 1.0))
    graph.insert(Edge(from: "b", to: "c", weight: 1.0))
    graph.insert(Edge(from: "c", to: "d", weight: 1.0))
    graph.insert(Edge(from: "d", to: "e", weight: 1.0))
    graph.insert(Edge(from: "e", to: "a", weight: 1.0))

    return graph
}

var nonBipartiteGraphWithBipartiteCycle: Graph {
    let graph = Graph()

    graph.insert(Edge(from: "a", to: "b", weight: 1.0))
    graph.insert(Edge(from: "b", to: "c", weight: 1.0))
    graph.insert(Edge(from: "c", to: "d", weight: 1.0))
    graph.insert(Edge(from: "d", to: "e", weight: 1.0))
    graph.insert(Edge(from: "e", to: "f", weight: 1.0))
    graph.insert(Edge(from: "f", to: "a", weight: 1.0))

    graph.insert(Edge(from: "v", to: "w", weight: 1.0))
    graph.insert(Edge(from: "w", to: "x", weight: 1.0))
    graph.insert(Edge(from: "x", to: "y", weight: 1.0))
    graph.insert(Edge(from: "y", to: "z", weight: 1.0))
    graph.insert(Edge(from: "z", to: "v", weight: 1.0))

    return graph
}

var treeGraph: Graph {
    let graph = Graph()

    graph.insert(Edge(from: "a", to: "b", weight: 1.0))
    graph.insert(Edge(from: "a", to: "c", weight: 1.0))
    graph.insert(Edge(from: "b", to: "d", weight: 1.0))
    graph.insert(Edge(from: "b", to: "e", weight: 1.0))
    graph.insert(Edge(from: "c", to: "f", weight: 1.0))
    graph.insert(Edge(from: "e", to: "g", weight: 1.0))
    graph.insert(Edge(from: "e", to: "h", weight: 1.0))

    return graph
}

var notTreeGraph: Graph {
    let graph = Graph()

    graph.insert(Edge(from: "a", to: "b", weight: 1.0))
    graph.insert(Edge(from: "a", to: "c", weight: 1.0))
    graph.insert(Edge(from: "b", to: "d", weight: 1.0))
    graph.insert(Edge(from: "d", to: "h", weight: 1.0))
    graph.insert(Edge(from: "h", to: "g", weight: 1.0))
    graph.insert(Edge(from: "g", to: "f", weight: 1.0))
    graph.insert(Edge(from: "f", to: "e", weight: 1.0))
    graph.insert(Edge(from: "e", to: "d", weight: 1.0))

    return graph
}
