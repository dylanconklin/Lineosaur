//
//  Graph Tests.swift
//  LineosaurTests
//
//  Created by Dylan Conklin on 9/21/23.
//

@testable import Lineosaur
import XCTest

final class GraphTests: XCTestCase {
    var sut: Graph!

    override func setUp() {
        sut = Graph()
    }

    override func tearDown() {
        sut = nil
    }

    func testVerticesAreInsertedWithEdges() {
        // given
        let expectedResult: [Vertex] = ["a", "b", "c"]

        // when
        sut.insert(Edge(from: "a", to: "b", weight: 1.0))
        sut.insert(Edge(from: "b", to: "c", weight: 1.0))

        // then
        XCTAssertEqual(sut.vertices, expectedResult)
    }

    func testVerticesAreInsertedWithEdgesBinding() {
        // given
        let expectedResult: [Vertex] = ["a", "b", "c"]

        // when
        sut.edges = [
            Edge(from: "a", to: "b", weight: 1.0),
            Edge(from: "b", to: "c", weight: 1.0),
        ]

        // then
        XCTAssertEqual(sut.vertices, expectedResult)
    }

    func testVerticesPersistAfterAllEdgeAreDeleted() {
        // given
        let expectedResult: [Vertex] = ["a", "b", "c"]

        // when
        sut.insert(Edge(from: "a", to: "b", weight: 1.0))
        sut.insert(Edge(from: "b", to: "c", weight: 1.0))

        sut.remove(Edge(from: "a", to: "b", weight: 1.0))
        sut.remove(Edge(from: "b", to: "c", weight: 1.0))

        // then
        XCTAssertEqual(sut.vertices, expectedResult)
    }

    func testRemoveAllEdgesConnectedToRemovedVertices() {
        // given
        let expectedResult: [Edge] = [Edge(from: "b", to: "c", weight: 1.0)]

        // when
        sut.insert(Edge(from: "a", to: "b", weight: 1.0))
        sut.insert(Edge(from: "b", to: "c", weight: 1.0))

        sut.remove("a")

        // then
        XCTAssertEqual(sut.edges, expectedResult)
    }
}
