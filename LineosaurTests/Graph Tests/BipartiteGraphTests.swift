//
//  Bipartite Graph Tests.swift
//  LineosaurTests
//
//  Created by Dylan Conklin on 9/28/23.
//

@testable import Lineosaur
import XCTest

class BipartiteGraphTests: XCTestCase {
    private var sut: Graph?

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
        if let result: Bool = sut?.isBipartite {
            // then
            XCTAssertTrue(result)
        } else {
            XCTFail("isBipartite didn't produce a value")
        }
    }

    func testNonBipartiteGraphIsNotBeBipartite() {
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

    func testDisconnectedGraphWithBipartiteAndNonBipartiteElementsIsNotBipartite() {
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

    func testGraphWithoutEdgesIsBipartite() {
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

    func testEmptyGraphIsBipartite() {
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
