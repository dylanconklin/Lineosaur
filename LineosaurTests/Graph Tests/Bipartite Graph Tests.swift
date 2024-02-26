//
//  Bipartite Graph Tests.swift
//  LineosaurTests
//
//  Created by Dylan Conklin on 9/28/23.
//

@testable import Lineosaur
import XCTest

class BipartiteGraphTests: XCTestCase {

    var sut: Graph!

    override func setUp() {
        sut = Graph()
    }

    override func tearDown() {
        sut = nil
    }

    func testBipartiteGraphIsBipartite () {
        // given
        sut = bipartite_graph

        // when
        let result = sut.isBipartite

        // then
        XCTAssertTrue(result)
    }

    func testNonBipartiteGraphIsNotBeBipartite () {
        // given
        sut = non_bipartite_graph

        // when
        let result = sut.isBipartite

        // then
        XCTAssertFalse(result)
    }

    func testDisconnectedGraphWithBipartiteAndNonBipartiteElementsIsNotBipartite () {
        // given
        sut = non_bipartite_graph_with_bipartite_cycle

        // when
        let result = sut.isBipartite

        // then
        XCTAssertFalse(result)
    }

    func testGraphWithoutEdgesIsBipartite () {
        // given

        // when
        sut.insert("A")
        sut.insert("B")
        sut.insert("C")

        let result = sut.isBipartite

        // then
        XCTAssertTrue(result)
    }

    func testEmptyGraphIsBipartite () {
        // given

        // when
        let result = sut.isBipartite

        // then
        XCTAssertTrue(result)
    }
}
