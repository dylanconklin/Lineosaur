//
//  Graph Tests.swift
//  LineosaurTests
//
//  Created by Dylan Conklin on 9/21/23.
//

@testable import Lineosaur
import Testing

@Suite
struct GraphTests {
    private var sut: Graph

    init() {
        sut = Graph()
    }

    @Test
    func verticesAreInsertedWithEdges() {
        // given
        let expectedResult: [Vertex] = ["a", "b", "c"]

        // when
        sut.insert(Edge(from: "a", toward: "b", weight: 1.0))
        sut.insert(Edge(from: "b", toward: "c", weight: 1.0))

        // then
        #expect(sut.vertices == expectedResult)
    }

    @Test
    func verticesAreInsertedWithEdgesBinding() {
        // given
        let expectedResult: [Vertex] = ["a", "b", "c"]

        // when
        sut.edges = [
            Edge(from: "a", toward: "b", weight: 1.0),
            Edge(from: "b", toward: "c", weight: 1.0),
        ]

        // then
        #expect(sut.vertices == expectedResult)
    }

    @Test
    func verticesPersistAfterAllEdgeAreDeleted() {
        // given
        let expectedResult: [Vertex] = ["a", "b", "c"]

        // when
        sut.insert(Edge(from: "a", toward: "b", weight: 1.0))
        sut.insert(Edge(from: "b", toward: "c", weight: 1.0))

        sut.remove(Edge(from: "a", toward: "b", weight: 1.0))
        sut.remove(Edge(from: "b", toward: "c", weight: 1.0))

        // then
        #expect(sut.vertices == expectedResult)
    }

    @Test
    func removeAllEdgesConnectedToRemovedVertices() {
        // given
        let expectedResult: [Edge] = [Edge(from: "b", toward: "c", weight: 1.0)]

        // when
        sut.insert(Edge(from: "a", toward: "b", weight: 1.0))
        sut.insert(Edge(from: "b", toward: "c", weight: 1.0))

        sut.remove("a")

        // then
        #expect(sut.edges == expectedResult)
    }
}
