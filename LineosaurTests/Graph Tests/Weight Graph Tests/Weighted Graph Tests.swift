//
//  Weighted Graph Tests.swift
//  LineosaurTests
//
//  Created by Dylan Conklin on 9/12/23.
//

import XCTest
@testable import Lineosaur

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
        expectedResult.insert(Edge(from: "a", to: "b", weight: 1))
        expectedResult.insert(Edge(from: "b", to: "c", weight: 2))
        expectedResult.insert(Edge(from: "a", to: "d", weight: 22))
        expectedResult.insert(Edge(from: "d", to: "f", weight: 11))
        expectedResult.insert(Edge(from: "d", to: "g", weight: 16))
        expectedResult.insert(Edge(from: "e", to: "g", weight: 6))
        expectedResult.insert(Edge(from: "f", to: "k", weight: 28))
        expectedResult.insert(Edge(from: "j", to: "k", weight: 5))
        expectedResult.insert(Edge(from: "i", to: "j", weight: 13))
        expectedResult.insert(Edge(from: "h", to: "i", weight: 8))

        // when
        let actualResult: Graph = sut.mst

        // then
        XCTAssertEqual(actualResult, expectedResult)
    }
}
