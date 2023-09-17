//
//  Graph Tests.swift
//  Adjacency Table BuilderTests
//
//  Created by Dylan Conklin on 9/11/23.
//

@testable import Adjacency_Table_Builder
import XCTest

final class Graph_Tests: XCTestCase {

    var sut: Graph!

    override func setUp() {
        sut = [
            Edge(from: "Baltimore", to: "Barre", weight: 496),
            Edge(from: "Baltimore", to: "Portland", weight: 2810),
            Edge(from: "Baltimore", to: "Richmond", weight: 149),
            Edge(from: "Baltimore", to: "SLC", weight: 2082),
            Edge(from: "Barre", to: "Portland", weight: 3052),
            Edge(from: "Barre", to: "Richmond", weight: 646),
            Edge(from: "Barre", to: "SLC", weight: 2328),
            Edge(from: "Portland", to: "Richmond", weight: 2867),
            Edge(from: "Portland", to: "SLC", weight: 768),
            Edge(from: "Richmond", to: "SLC", weight: 2141),
        ]
    }

    override func tearDown() {
        sut = nil
    }

    func testAcyclicGraphIsNotCyclic() {
        // given
        sut = acyclic_graph

        // when
        let result: Bool = sut.isCyclic

        // then
        XCTAssertFalse(result)
    }

    func testCyclicGraphIsCyclic() {
        // given
        sut = cyclic_graph

        // when
        let result: Bool = sut.isCyclic

        // then
        XCTAssertTrue(result)
    }

    func testEmptyGraphIsNotCyclic() {
        // given
        sut = []

        // when
        let result: Bool = sut.isCyclic

        // then
        XCTAssertFalse(result)
    }

    func testMSTCities() {
        // given
        sut = cities
        let expectedResult: Graph = [
            Edge(from: "Baltimore", to: "Barre", weight: 496),
            Edge(from: "Baltimore", to: "Richmond", weight: 149),
            Edge(from: "Baltimore", to: "SLC", weight: 2082),
            Edge(from: "Portland", to: "SLC", weight: 768),
        ]

        // when
        let actualResult: Graph = sut.mst

        // then
        XCTAssertEqual(actualResult, expectedResult)
    }
}
