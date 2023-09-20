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
        sut = [
            Edge(from: "A", to: "B", weight: 3),
            Edge(from: "A", to: "C", weight: 4),
            Edge(from: "B", to: "E", weight: 7),
            Edge(from: "B", to: "I", weight: 11),
            Edge(from: "C", to: "D", weight: 7),
            Edge(from: "C", to: "F", weight: 9),
            Edge(from: "D", to: "E", weight: 9),
            Edge(from: "E", to: "F", weight: 11),
            Edge(from: "E", to: "H", weight: 13),
            Edge(from: "F", to: "G", weight: 13),
            Edge(from: "G", to: "H", weight: 15),
            Edge(from: "G", to: "K", weight: 18),
            Edge(from: "H", to: "J", weight: 18),
            Edge(from: "H", to: "K", weight: 19),
            Edge(from: "H", to: "L", weight: 20),
            Edge(from: "I", to: "J", weight: 19),
        ]
    }

    override func tearDown() {
        sut = nil
    }

    func testMST() {
        // given
        let expectedResult: Graph = [
            Edge(from: "A", to: "B", weight: 3),
            Edge(from: "A", to: "C", weight: 4),
            Edge(from: "C", to: "D", weight: 7),
            Edge(from: "B", to: "E", weight: 7),
            Edge(from: "C", to: "F", weight: 9),
            Edge(from: "B", to: "I", weight: 11),
            Edge(from: "E", to: "H", weight: 13),
            Edge(from: "F", to: "G", weight: 13),
            Edge(from: "G", to: "K", weight: 18),
            Edge(from: "H", to: "J", weight: 18),
            Edge(from: "H", to: "L", weight: 20),
        ]

        // when
        let actualResult: Graph = sut.mst

        // then
        XCTAssertEqual(actualResult, expectedResult)
    }

}
