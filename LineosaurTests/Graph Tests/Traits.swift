//
//  Graph Tests.swift
//  LineosaurTests
//
//  Created by Dylan Conklin on 9/21/23.
//

@testable import Lineosaur
import Testing

var sut: [TestableGraph] {
    [acyclicGraph, bipartiteGraph, connectedGraph, disconnectedGraphNoOutlierVertex, disconnectedGraphOutlierVertex, emptyGraph, cyclicGraph, mixedIntAndDouble, nonBipartiteGraph, nonBipartiteGraphWithBipartiteCycle, notTreeGraph, treeGraph, trivialGraph, weightedGraph]
}

@Suite
struct GraphTests {
    @Test(
        .tags(.graphTrait),
        arguments: sut
    )
    func isBipartite(sut: TestableGraph) {
        if let expectedResult = sut.expectedResults.isBipartite {
            #expect(expectedResult == sut.graph.isBipartite)
        }
    }

    @Test(
        .tags(.graphTrait),
        arguments: sut
    )
    func isComplete(sut: TestableGraph) {
        if let expectedResult = sut.expectedResults.isComplete {
            #expect(expectedResult == sut.graph.isComplete)
        }
    }

    @Test(
        .tags(.graphTrait),
        arguments: sut
    )
    func isConnected(sut: TestableGraph) {
        if let expectedResult = sut.expectedResults.isConnected {
            #expect(expectedResult == sut.graph.isConnected)
        }
    }

    @Test(
        .tags(.graphTrait),
        arguments: sut
    )
    func isCyclic(sut: TestableGraph) {
        if let expectedResult = sut.expectedResults.isCyclic {
            #expect(expectedResult == sut.graph.isCyclic)
        }
    }

    @Test(
        .tags(.graphTrait),
        arguments: sut
    )
    func isEmpty(sut: TestableGraph) {
        if let expectedResult = sut.expectedResults.isEmpty {
            #expect(expectedResult == sut.graph.isEmpty)
        }
    }

    @Test(
        .tags(.graphTrait),
        arguments: sut
    )
    func isMulti(sut: TestableGraph) {
        if let expectedResult = sut.expectedResults.isMulti {
            #expect(expectedResult == sut.graph.isMulti)
        }
    }

    @Test(
        .tags(.graphTrait),
        arguments: sut
    )
    func isSimple(sut: TestableGraph) {
        if let expectedResult = sut.expectedResults.isSimple {
            #expect(expectedResult == sut.graph.isSimple)
        }
    }

    @Test(
        .tags(.graphTrait),
        arguments: sut
    )
    func isTree(sut: TestableGraph) {
        if let expectedResult = sut.expectedResults.isTree {
            #expect(expectedResult == sut.graph.isTree)
        }
    }

    @Test(
        .tags(.graphTrait),
        arguments: sut
    )
    func isTrivial(sut: TestableGraph) {
        if let expectedResult = sut.expectedResults.isTrivial {
            #expect(expectedResult == sut.graph.isTrivial)
        }
    }

//    @Test
//    func verticesAreInsertedWithEdges() {
//        // given
//        let expectedResult: [Vertex] = ["a", "b", "c"]
//
//        // when
//        sut.insert(Edge(from: "a", toward: "b", weight: 1.0))
//        sut.insert(Edge(from: "b", toward: "c", weight: 1.0))
//
//        // then
//        #expect(sut.vertices == expectedResult)
//    }
//
//    @Test
//    func verticesAreInsertedWithEdgesBinding() {
//        // given
//        let expectedResult: [Vertex] = ["a", "b", "c"]
//
//        // when
//        sut.edges = [
//            Edge(from: "a", toward: "b", weight: 1.0),
//            Edge(from: "b", toward: "c", weight: 1.0),
//        ]
//
//        // then
//        #expect(sut.vertices == expectedResult)
//    }
//
//    @Test
//    func verticesPersistAfterAllEdgeAreDeleted() {
//        // given
//        let expectedResult: [Vertex] = ["a", "b", "c"]
//
//        // when
//        sut.insert(Edge(from: "a", toward: "b", weight: 1.0))
//        sut.insert(Edge(from: "b", toward: "c", weight: 1.0))
//
//        sut.remove(Edge(from: "a", toward: "b", weight: 1.0))
//        sut.remove(Edge(from: "b", toward: "c", weight: 1.0))
//
//        // then
//        #expect(sut.vertices == expectedResult)
//    }
//
//    @Test
//    func removeAllEdgesConnectedToRemovedVertices() {
//        // given
//        let expectedResult: [Edge] = [Edge(from: "b", toward: "c", weight: 1.0)]
//
//        // when
//        sut.insert(Edge(from: "a", toward: "b", weight: 1.0))
//        sut.insert(Edge(from: "b", toward: "c", weight: 1.0))
//
//        sut.remove("a")
//
//        // then
//        #expect(sut.edges == expectedResult)
//    }
}
