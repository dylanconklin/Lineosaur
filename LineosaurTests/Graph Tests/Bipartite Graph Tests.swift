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

    func testBipartiteGraphIsBipartite() {
        // given
        sut = bipartiteGraph

        // when
        let result: Bool = sut.isBipartite

        // then
        XCTAssertTrue(result)
    }

    func testNonBipartiteGraphIsNotBeBipartite() {
        // given
        sut = nonBipartiteGraph

        // when
        let result: Bool = sut.isBipartite

        // then
        XCTAssertFalse(result)
    }

    func testDisconnectedGraphWithBipartiteAndNonBipartiteElementsIsNotBipartite() {
        // given
        sut = nonBipartiteGraphWithBipartiteCycle

        // when
        let result: Bool = sut.isBipartite

        // then
        XCTAssertFalse(result)
    }

    func testGraphWithoutEdgesIsBipartite() {
        // given

        // when
        sut.insert("A")
        sut.insert("B")
        sut.insert("C")

        let result: Bool = sut.isBipartite

        // then
        XCTAssertTrue(result)
    }

    func testEmptyGraphIsBipartite() {
        // given

        // when
        let result: Bool = sut.isBipartite

        // then
        XCTAssertTrue(result)
    }
}
