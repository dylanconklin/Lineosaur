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

    override internal func setUp() {
        sut = Graph()
    }

    override internal func tearDown() {
        sut = nil
    }

    internal func testBipartiteGraphIsBipartite() {
        // given
        sut = bipartiteGraph

        // when
        if let result: Bool = sut?.isBipartite {
            // then
            XCTAssertTrue(result)
        } else {
            XCTFail("isBipartite didn't produce a value")
        }
    }

    internal func testNonBipartiteGraphIsNotBeBipartite() {
        // given
        sut = nonBipartiteGraph

        // when
        if let result: Bool = sut?.isBipartite {
            // then
            XCTAssertFalse(result)
        } else {
            XCTFail("isBipartite didn't produce a value")
        }
    }

    internal func testDisconnectedGraphWithBipartiteAndNonBipartiteElementsIsNotBipartite() {
        // given
        sut = nonBipartiteGraphWithBipartiteCycle

        // when
        if let result: Bool = sut?.isBipartite {
            // then
            XCTAssertFalse(result)
        } else {
            XCTFail("isBipartite didn't produce a value")
        }
    }

    internal func testGraphWithoutEdgesIsBipartite() {
        // given

        // when
        sut?.insert("A")
        sut?.insert("B")
        sut?.insert("C")

        if let result: Bool = sut?.isBipartite {
            // then
            XCTAssertTrue(result)
        } else {
            XCTFail("isBipartite didn't produce a value")
        }
    }

    internal func testEmptyGraphIsBipartite() {
        // given

        // when
        if let result: Bool = sut?.isBipartite {
            // then
            XCTAssertTrue(result)
        } else {
            XCTFail("isBipartite didn't produce a value")
        }
    }
}
