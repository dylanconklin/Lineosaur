//
//  TestableGraph.swift
//  LineosaurTests
//
//  Created by Dylan Conklin on 6/12/24.
//

@testable import Lineosaur
import Foundation

struct TestableGraph {
    var graph: Graph
    var expectedResults: TestingGraphResults = .init()
}

struct TestingGraphResults {
    var isBipartite: Bool?
    var isComplete: Bool?
    var isConnected: Bool?
    var isCyclic: Bool?
    var isEmpty: Bool?
    var isMulti: Bool?
    var isSimple: Bool?
    var isTree: Bool?
    var isTrivial: Bool?
}
