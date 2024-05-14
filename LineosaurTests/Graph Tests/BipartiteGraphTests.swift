// swiftlint:disable *
//
//  Bipartite Graph Tests.swift
//  LineosaurTests
//
//  Created by Dylan Conklin on 9/28/23.
//

@testable import Lineosaur
import XCTest

internal class BipartiteGraphTests: XCTestCase {
    private var sut: Graph?

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
        if let result: Bool = sut?.isBipartite {
            // then
            XCTAssertTrue(result)
        } else {
            XCTFail()
        }
    }

    private func testNonBipartiteGraphIsNotBeBipartite() {
        // given
        sut = nonBipartiteGraph

        // when
        if let result: Bool = sut?.isBipartite {
            // then
            XCTAssertFalse(result)
        } else {
            XCTFail()
        }
    }

    private func testDisconnectedGraphWithBipartiteAndNonBipartiteElementsIsNotBipartite() {
        // given
        sut = nonBipartiteGraphWithBipartiteCycle

        // when
        if let result: Bool = sut?.isBipartite {
            // then
            XCTAssertFalse(result)
        } else {
            XCTFail()
        }
    }

    private func testGraphWithoutEdgesIsBipartite() {
        // given

        // when
        sut?.insert("A")
        sut?.insert("B")
        sut?.insert("C")

        if let result: Bool = sut?.isBipartite {
            // then
            XCTAssertTrue(result)
        } else {
            XCTFail()
        }
    }

    private func testEmptyGraphIsBipartite() {
        // given

        // when
        if let result: Bool = sut?.isBipartite {
            // then
            XCTAssertTrue(result)
        } else {
            XCTFail()
        }
    }
}
