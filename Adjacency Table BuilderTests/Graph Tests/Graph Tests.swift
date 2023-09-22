//
//  Graph Tests.swift
//  Adjacency Table BuilderTests
//
//  Created by Dylan Conklin on 9/21/23.
//

import XCTest
@testable import Adjacency_Table_Builder

final class Graph_Tests: XCTestCase {

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

    func testRemovedVerticesRemoveAllConnectedEdges() {
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
