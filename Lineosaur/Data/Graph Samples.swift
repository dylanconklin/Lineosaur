//
//  Graph Samples.swift
//  Lineosaur
//
//  Created by Dylan Conklin on 9/20/23.
//

import Foundation

internal var mixedIntAndDouble: Graph {
    let graph: Graph = .init()

    graph.insert(Edge(from: "A", toward: "B", weight: 1.0))
    graph.insert(Edge(from: "B", toward: "C", weight: 1.5))

    return graph
}

internal var acyclicGraph: Graph {
    let graph: Graph = .init()

    graph.insert(Edge(from: "1", toward: "2", weight: 1))
    graph.insert(Edge(from: "2", toward: "3", weight: 1))
    graph.insert(Edge(from: "2", toward: "4", weight: 1))
    graph.insert(Edge(from: "4", toward: "5", weight: 1))
    graph.insert(Edge(from: "4", toward: "6", weight: 1))
    graph.insert(Edge(from: "5", toward: "6", weight: 1))
    graph.insert(Edge(from: "6", toward: "3", weight: 1))

    return graph
}

internal var cyclicGraph: Graph {
    let graph: Graph = .init()

    graph.insert(Edge(from: "1", toward: "2", weight: 1))
    graph.insert(Edge(from: "2", toward: "3", weight: 1))
    graph.insert(Edge(from: "2", toward: "4", weight: 1))
    graph.insert(Edge(from: "4", toward: "5", weight: 1))
    graph.insert(Edge(from: "5", toward: "6", weight: 1))
    graph.insert(Edge(from: "6", toward: "3", weight: 1))
    graph.insert(Edge(from: "6", toward: "4", weight: 1))

    return graph
}

internal var weightedGraph: Graph {
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

internal var connectedGraph: Graph {
    let graph: Graph = .init()

    graph.insert(Edge(from: "a", toward: "b", weight: 1.0))
    graph.insert(Edge(from: "b", toward: "c", weight: 1.0))
    graph.insert(Edge(from: "c", toward: "a", weight: 1.0))
    graph.insert(Edge(from: "c", toward: "d", weight: 1.0))
    graph.insert(Edge(from: "d", toward: "e", weight: 1.0))
    graph.insert(Edge(from: "e", toward: "f", weight: 1.0))

    return graph
}

internal var disconnectedGraphNoOutlierVertex: Graph {
    let graph: Graph = .init()

    graph.insert(Edge(from: "a", toward: "b", weight: 1.0))
    graph.insert(Edge(from: "b", toward: "c", weight: 1.0))
    graph.insert(Edge(from: "d", toward: "e", weight: 1.0))
    graph.insert(Edge(from: "e", toward: "f", weight: 1.0))

    return graph
}

internal var disconnectedGraphOutlierVertex: Graph {
    let graph: Graph = .init()

    graph.insert(Edge(from: "a", toward: "b", weight: 1.0))
    graph.insert(Edge(from: "b", toward: "c", weight: 1.0))
    graph.insert(Edge(from: "c", toward: "a", weight: 1.0))
    graph.insert(Edge(from: "d", toward: "e", weight: 1.0))
    graph.insert(Edge(from: "e", toward: "f", weight: 1.0))
    graph.insert("z")

    return graph
}

internal var bipartiteGraph: Graph {
    let graph: Graph = .init()

    graph.insert(Edge(from: "a", toward: "b", weight: 1.0))
    graph.insert(Edge(from: "b", toward: "c", weight: 1.0))
    graph.insert(Edge(from: "c", toward: "d", weight: 1.0))
    graph.insert(Edge(from: "d", toward: "e", weight: 1.0))
    graph.insert(Edge(from: "e", toward: "f", weight: 1.0))
    graph.insert(Edge(from: "f", toward: "a", weight: 1.0))

    return graph
}

internal var nonBipartiteGraph: Graph {
    let graph: Graph = .init()

    graph.insert(Edge(from: "a", toward: "b", weight: 1.0))
    graph.insert(Edge(from: "b", toward: "c", weight: 1.0))
    graph.insert(Edge(from: "c", toward: "d", weight: 1.0))
    graph.insert(Edge(from: "d", toward: "e", weight: 1.0))
    graph.insert(Edge(from: "e", toward: "a", weight: 1.0))

    return graph
}

internal var nonBipartiteGraphWithBipartiteCycle: Graph {
    let graph: Graph = .init()

    graph.insert(Edge(from: "a", toward: "b", weight: 1.0))
    graph.insert(Edge(from: "b", toward: "c", weight: 1.0))
    graph.insert(Edge(from: "c", toward: "d", weight: 1.0))
    graph.insert(Edge(from: "d", toward: "e", weight: 1.0))
    graph.insert(Edge(from: "e", toward: "f", weight: 1.0))
    graph.insert(Edge(from: "f", toward: "a", weight: 1.0))

    graph.insert(Edge(from: "v", toward: "w", weight: 1.0))
    graph.insert(Edge(from: "w", toward: "x", weight: 1.0))
    graph.insert(Edge(from: "x", toward: "y", weight: 1.0))
    graph.insert(Edge(from: "y", toward: "z", weight: 1.0))
    graph.insert(Edge(from: "z", toward: "v", weight: 1.0))

    return graph
}

internal var treeGraph: Graph {
    let graph: Graph = .init()

    graph.insert(Edge(from: "a", toward: "b", weight: 1.0))
    graph.insert(Edge(from: "a", toward: "c", weight: 1.0))
    graph.insert(Edge(from: "b", toward: "d", weight: 1.0))
    graph.insert(Edge(from: "b", toward: "e", weight: 1.0))
    graph.insert(Edge(from: "c", toward: "f", weight: 1.0))
    graph.insert(Edge(from: "e", toward: "g", weight: 1.0))
    graph.insert(Edge(from: "e", toward: "h", weight: 1.0))

    return graph
}

internal var notTreeGraph: Graph {
    let graph: Graph = .init()

    graph.insert(Edge(from: "a", toward: "b", weight: 1.0))
    graph.insert(Edge(from: "a", toward: "c", weight: 1.0))
    graph.insert(Edge(from: "b", toward: "d", weight: 1.0))
    graph.insert(Edge(from: "d", toward: "h", weight: 1.0))
    graph.insert(Edge(from: "h", toward: "g", weight: 1.0))
    graph.insert(Edge(from: "g", toward: "f", weight: 1.0))
    graph.insert(Edge(from: "f", toward: "e", weight: 1.0))
    graph.insert(Edge(from: "e", toward: "d", weight: 1.0))

    return graph
}
