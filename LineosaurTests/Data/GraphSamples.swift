//
//  Graph Samples.swift
//  Lineosaur
//
//  Created by Dylan Conklin on 9/20/23.
//

import Foundation
@testable import Lineosaur

var emptyGraph: TestableGraph {
    // Create Graph
    let graph: Graph = .init()

    // Create Expected Graph Results
    let expectedResults: TestingGraphResults = .init(
        isEmpty: true,
        isTrivial: false
    )

    return TestableGraph(graph: graph, expectedResults: expectedResults)
}

var trivialGraph: TestableGraph {
    // Create Graph
    let graph: Graph = .init()

    graph.insert("X")

    // Create Expected Graph Results
    let expectedResults: TestingGraphResults = .init(
        isEmpty: false,
        isTrivial: true
    )

    return TestableGraph(graph: graph, expectedResults: expectedResults)
}

var mixedIntAndDouble: TestableGraph {
    // Create Graph
    let graph: Graph = .init()

    graph.insert(Edge(from: "A", toward: "B", weight: 1.0))
    graph.insert(Edge(from: "B", toward: "C", weight: 1.5))

    // Create Expected Graph Results
    let expectedResults: TestingGraphResults = .init(
        isConnected: true,
        isEmpty: false,
        isTree: true,
        isTrivial: false
    )

    return TestableGraph(graph: graph, expectedResults: expectedResults)
}

var acyclicGraph: TestableGraph {
    // Create Graph
    let graph: Graph = .init()

    graph.insert(Edge(from: "1", toward: "2", weight: 1))
    graph.insert(Edge(from: "2", toward: "3", weight: 1))
    graph.insert(Edge(from: "2", toward: "4", weight: 1))
    graph.insert(Edge(from: "4", toward: "5", weight: 1))
    graph.insert(Edge(from: "4", toward: "6", weight: 1))
    graph.insert(Edge(from: "5", toward: "6", weight: 1))
    graph.insert(Edge(from: "6", toward: "3", weight: 1))

    // Create Expected Graph Results
    let expectedResults: TestingGraphResults = .init(
        isConnected: true,
        isCyclic: false,
        isEmpty: false,
        isTree: true,
        isTrivial: false
    )

    return TestableGraph(graph: graph, expectedResults: expectedResults)
}

var cyclicGraph: TestableGraph {
    // Create Graph
    let graph: Graph = .init()

    graph.insert(Edge(from: "1", toward: "2", weight: 1))
    graph.insert(Edge(from: "2", toward: "3", weight: 1))
    graph.insert(Edge(from: "2", toward: "4", weight: 1))
    graph.insert(Edge(from: "4", toward: "5", weight: 1))
    graph.insert(Edge(from: "5", toward: "6", weight: 1))
    graph.insert(Edge(from: "6", toward: "3", weight: 1))
    graph.insert(Edge(from: "6", toward: "4", weight: 1))

    // Create Expected Graph Results
    let expectedResults: TestingGraphResults = .init(
        isConnected: true,
        isCyclic: true,
        isEmpty: false,
        isTree: false,
        isTrivial: false
    )

    return TestableGraph(graph: graph, expectedResults: expectedResults)
}

var weightedGraph: TestableGraph {
    // Create Graph
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

    // Create Expected Graph Results
    let expectedResults: TestingGraphResults = .init(
        isConnected: true,
        isEmpty: false,
        isTree: true,
        isTrivial: false
    )

    return TestableGraph(graph: graph, expectedResults: expectedResults)
}

var connectedGraph: TestableGraph {
    // Create Graph
    let graph: Graph = .init()

    graph.insert(Edge(from: "a", toward: "b", weight: 1.0))
    graph.insert(Edge(from: "b", toward: "c", weight: 1.0))
    graph.insert(Edge(from: "c", toward: "a", weight: 1.0))
    graph.insert(Edge(from: "c", toward: "d", weight: 1.0))
    graph.insert(Edge(from: "d", toward: "e", weight: 1.0))
    graph.insert(Edge(from: "e", toward: "f", weight: 1.0))

    // Create Expected Graph Results
    let expectedResults: TestingGraphResults = .init(
        isConnected: true,
        isEmpty: false,
        isTree: false,
        isTrivial: false
    )

    return TestableGraph(graph: graph, expectedResults: expectedResults)
}

var disconnectedGraphNoOutlierVertex: TestableGraph {
    // Create Graph
    let graph: Graph = .init()

    graph.insert(Edge(from: "a", toward: "b", weight: 1.0))
    graph.insert(Edge(from: "b", toward: "c", weight: 1.0))
    graph.insert(Edge(from: "d", toward: "e", weight: 1.0))
    graph.insert(Edge(from: "e", toward: "f", weight: 1.0))

    // Create Expected Graph Results
    let expectedResults: TestingGraphResults = .init(
        isConnected: false,
        isEmpty: false,
        isTree: false,
        isTrivial: false
    )

    return TestableGraph(graph: graph, expectedResults: expectedResults)
}

var disconnectedGraphOutlierVertex: TestableGraph {
    // Create Graph
    let graph: Graph = .init()

    graph.insert(Edge(from: "a", toward: "b", weight: 1.0))
    graph.insert(Edge(from: "b", toward: "c", weight: 1.0))
    graph.insert(Edge(from: "c", toward: "a", weight: 1.0))
    graph.insert(Edge(from: "d", toward: "e", weight: 1.0))
    graph.insert(Edge(from: "e", toward: "f", weight: 1.0))
    graph.insert("z")

    // Create Expected Graph Results
    let expectedResults: TestingGraphResults = .init(
        isConnected: false,
        isEmpty: false,
        isTree: false,
        isTrivial: false
    )

    return TestableGraph(graph: graph, expectedResults: expectedResults)
}

var bipartiteGraph: TestableGraph {
    // Create Graph
    let graph: Graph = .init()

    graph.insert(Edge(from: "a", toward: "b", weight: 1.0))
    graph.insert(Edge(from: "b", toward: "c", weight: 1.0))
    graph.insert(Edge(from: "c", toward: "d", weight: 1.0))
    graph.insert(Edge(from: "d", toward: "e", weight: 1.0))
    graph.insert(Edge(from: "e", toward: "f", weight: 1.0))
    graph.insert(Edge(from: "f", toward: "a", weight: 1.0))

    // Create Expected Graph Results
    let expectedResults: TestingGraphResults = .init(
        isBipartite: true,
        isConnected: true,
        isEmpty: false,
        isTree: false,
        isTrivial: false
    )

    return TestableGraph(graph: graph, expectedResults: expectedResults)
}

var nonBipartiteGraph: TestableGraph {
    // Create Graph
    let graph: Graph = .init()

    graph.insert(Edge(from: "a", toward: "b", weight: 1.0))
    graph.insert(Edge(from: "b", toward: "c", weight: 1.0))
    graph.insert(Edge(from: "c", toward: "d", weight: 1.0))
    graph.insert(Edge(from: "d", toward: "e", weight: 1.0))
    graph.insert(Edge(from: "e", toward: "a", weight: 1.0))

    // Create Expected Graph Results
    let expectedResults: TestingGraphResults = .init(
        isBipartite: false,
        isConnected: true,
        isEmpty: false,
        isTree: false,
        isTrivial: false
    )

    return TestableGraph(graph: graph, expectedResults: expectedResults)
}

var nonBipartiteGraphWithBipartiteCycle: TestableGraph {
    // Create Graph
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

    // Create Expected Graph Results
    let expectedResults: TestingGraphResults = .init(
        isBipartite: false,
        isConnected: false,
        isEmpty: false,
        isTree: false,
        isTrivial: false
    )

    return TestableGraph(graph: graph, expectedResults: expectedResults)
}

var treeGraph: TestableGraph {
    // Create Graph
    let graph: Graph = .init()

    graph.insert(Edge(from: "a", toward: "b", weight: 1.0))
    graph.insert(Edge(from: "a", toward: "c", weight: 1.0))
    graph.insert(Edge(from: "b", toward: "d", weight: 1.0))
    graph.insert(Edge(from: "b", toward: "e", weight: 1.0))
    graph.insert(Edge(from: "c", toward: "f", weight: 1.0))
    graph.insert(Edge(from: "e", toward: "g", weight: 1.0))
    graph.insert(Edge(from: "e", toward: "h", weight: 1.0))

    // Create Expected Graph Results
    let expectedResults: TestingGraphResults = .init(
        isConnected: true,
        isCyclic: false,
        isEmpty: false,
        isTree: true,
        isTrivial: false
    )

    return TestableGraph(graph: graph, expectedResults: expectedResults)
}

var notTreeGraph: TestableGraph {
    // Create Graph
    let graph: Graph = .init()

    graph.insert(Edge(from: "a", toward: "b", weight: 1.0))
    graph.insert(Edge(from: "a", toward: "c", weight: 1.0))
    graph.insert(Edge(from: "b", toward: "d", weight: 1.0))
    graph.insert(Edge(from: "d", toward: "h", weight: 1.0))
    graph.insert(Edge(from: "h", toward: "g", weight: 1.0))
    graph.insert(Edge(from: "g", toward: "f", weight: 1.0))
    graph.insert(Edge(from: "f", toward: "e", weight: 1.0))
    graph.insert(Edge(from: "e", toward: "d", weight: 1.0))

    // Create Expected Graph Results
    let expectedResults: TestingGraphResults = .init(
        isConnected: true,
        isCyclic: true,
        isEmpty: false,
        isTree: false,
        isTrivial: false
    )

    return TestableGraph(graph: graph, expectedResults: expectedResults)
}
