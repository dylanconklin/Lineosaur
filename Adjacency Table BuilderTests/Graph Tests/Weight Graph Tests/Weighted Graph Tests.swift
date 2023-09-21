//
//  Weighted Graph Tests.swift
//  Adjacency Table BuilderTests
//
//  Created by Dylan Conklin on 9/12/23.
//

import XCTest
@testable import Adjacency_Table_Builder

final class Weighted_Graph_Tests: XCTestCase {
    
    var sut: Graph!

    override func setUp() {
        sut = weighted_graph
    }

    override func tearDown() {
        sut = nil
    }

    func testMST() {
        // given
        var expectedResult: Graph = Graph()
        expectedResult.insert(Edge(from: "A", to: "B", weight: 3))
        expectedResult.insert(Edge(from: "A", to: "C", weight: 4))
        expectedResult.insert(Edge(from: "C", to: "D", weight: 7))
        expectedResult.insert(Edge(from: "B", to: "E", weight: 7))
        expectedResult.insert(Edge(from: "C", to: "F", weight: 9))
        expectedResult.insert(Edge(from: "B", to: "I", weight: 11))
        expectedResult.insert(Edge(from: "E", to: "H", weight: 13))
        expectedResult.insert(Edge(from: "F", to: "G", weight: 13))
        expectedResult.insert(Edge(from: "G", to: "K", weight: 18))
        expectedResult.insert(Edge(from: "H", to: "J", weight: 18))
        expectedResult.insert(Edge(from: "H", to: "L", weight: 20))

        // when
        let actualResult: Graph = sut.mst

        // then
        XCTAssertEqual(actualResult, expectedResult)
    }

}
