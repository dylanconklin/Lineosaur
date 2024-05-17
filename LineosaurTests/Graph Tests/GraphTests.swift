//
//  Graph Tests.swift
//  LineosaurTests
//
//  Created by Dylan Conklin on 9/21/23.
//

@testable import Lineosaur
import XCTest

internal final class GraphTests: XCTestCase {
    private var sut: Graph?

    override internal func setUp() {
        sut = Graph()
    }

    override internal func tearDown() {
        sut = nil
    }

    internal func testVerticesAreInsertedWithEdges() {
        // given
        let expectedResult: [Vertex] = ["a", "b", "c"]

        // when
        sut?.insert(Edge(from: "a", toward: "b", weight: 1.0))
        sut?.insert(Edge(from: "b", toward: "c", weight: 1.0))

        // then
        XCTAssertEqual(sut?.vertices, expectedResult)
    }

    internal func testVerticesAreInsertedWithEdgesBinding() {
        // given
        let expectedResult: [Vertex] = ["a", "b", "c"]

        // when
        sut?.edges = [
            Edge(from: "a", toward: "b", weight: 1.0),
            Edge(from: "b", toward: "c", weight: 1.0)
        ]

        // then
        XCTAssertEqual(sut?.vertices, expectedResult)
    }

    internal func testVerticesPersistAfterAllEdgeAreDeleted() {
        // given
        let expectedResult: [Vertex] = ["a", "b", "c"]

        // when
        sut?.insert(Edge(from: "a", toward: "b", weight: 1.0))
        sut?.insert(Edge(from: "b", toward: "c", weight: 1.0))

        sut?.remove(Edge(from: "a", toward: "b", weight: 1.0))
        sut?.remove(Edge(from: "b", toward: "c", weight: 1.0))

        // then
        XCTAssertEqual(sut?.vertices, expectedResult)
    }

    internal func testRemoveAllEdgesConnectedToRemovedVertices() {
        // given
        let expectedResult: [Edge] = [Edge(from: "b", toward: "c", weight: 1.0)]

        // when
        sut?.insert(Edge(from: "a", toward: "b", weight: 1.0))
        sut?.insert(Edge(from: "b", toward: "c", weight: 1.0))

        sut?.remove("a")

        // then
        XCTAssertEqual(sut?.edges, expectedResult)
    }
}
