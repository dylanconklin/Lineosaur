//
//  Bipartite Graph Tests.swift
//  LineosaurTests
//
//  Created by Dylan Conklin on 9/28/23.
//

@testable import Lineosaur
import XCTest

internal class BipartiteGraphTests: XCTestCase {
    private var sut: Graph!

    internal override func setUp() {
        sut = Graph()
    }

    internal override func tearDown() {
        sut = nil
    }

    private func testBipartiteGraphIsBipartite() {
        // given
        sut = bipartiteGraph

        // when
        let result: Bool = sut.isBipartite

        // then
        XCTAssertTrue(result)
    }

    private func testNonBipartiteGraphIsNotBeBipartite() {
        // given
        sut = nonBipartiteGraph

        // when
        let result: Bool = sut.isBipartite

        // then
        XCTAssertFalse(result)
    }

    private func testDisconnectedGraphWithBipartiteAndNonBipartiteElementsIsNotBipartite() {
        // given
        sut = nonBipartiteGraphWithBipartiteCycle

        // when
        let result: Bool = sut.isBipartite

        // then
        XCTAssertFalse(result)
    }

    private func testGraphWithoutEdgesIsBipartite() {
        // given

        // when
        sut.insert("A")
        sut.insert("B")
        sut.insert("C")

        let result: Bool = sut.isBipartite

        // then
        XCTAssertTrue(result)
    }

    private func testEmptyGraphIsBipartite() {
        // given

        // when
        let result: Bool = sut.isBipartite

        // then
        XCTAssertTrue(result)
    }
}
