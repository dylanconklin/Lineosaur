//
//  Graph Test Samples.swift
//
//  Created by Dylan Conklin on 9/20/23.
//

import Foundation
import XCTest
@testable import Adjacency_Table_Builder

var acyclic_graph: Graph {
    var graph: Graph = Graph()

    graph.insert(Edge(from: "1", to: "2", weight: 1))
    graph.insert(Edge(from: "2", to: "3", weight: 1))
    graph.insert(Edge(from: "2", to: "4", weight: 1))
    graph.insert(Edge(from: "4", to: "5", weight: 1))
    graph.insert(Edge(from: "4", to: "6", weight: 1))
    graph.insert(Edge(from: "5", to: "6", weight: 1))
    graph.insert(Edge(from: "6", to: "3", weight: 1))

    return graph
}

var cyclic_graph: Graph {
    var graph: Graph = Graph()

    graph.insert(Edge(from: "1", to: "2", weight: 1))
    graph.insert(Edge(from: "2", to: "3", weight: 1))
    graph.insert(Edge(from: "2", to: "4", weight: 1))
    graph.insert(Edge(from: "4", to: "5", weight: 1))
    graph.insert(Edge(from: "5", to: "6", weight: 1))
    graph.insert(Edge(from: "6", to: "3", weight: 1))
    graph.insert(Edge(from: "6", to: "4", weight: 1))

    return graph
}

var weighted_graph: Graph {
    var graph: Graph = Graph()

    graph.insert(Edge(from: "A", to: "B", weight: 3))
    graph.insert(Edge(from: "A", to: "C", weight: 4))
    graph.insert(Edge(from: "B", to: "E", weight: 7))
    graph.insert(Edge(from: "B", to: "I", weight: 11))
    graph.insert(Edge(from: "C", to: "D", weight: 7))
    graph.insert(Edge(from: "C", to: "F", weight: 9))
    graph.insert(Edge(from: "D", to: "E", weight: 9))
    graph.insert(Edge(from: "E", to: "F", weight: 11))
    graph.insert(Edge(from: "E", to: "H", weight: 13))
    graph.insert(Edge(from: "F", to: "G", weight: 13))
    graph.insert(Edge(from: "G", to: "H", weight: 15))
    graph.insert(Edge(from: "G", to: "K", weight: 18))
    graph.insert(Edge(from: "H", to: "J", weight: 18))
    graph.insert(Edge(from: "H", to: "K", weight: 19))
    graph.insert(Edge(from: "H", to: "L", weight: 20))
    graph.insert(Edge(from: "I", to: "J", weight: 19))

    return graph
}
