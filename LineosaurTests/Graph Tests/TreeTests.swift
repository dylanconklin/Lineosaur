//
//  Tree Tests.swift
//  LineosaurTests
//
//  Created by Dylan Conklin on 9/29/23.
//

@testable import Lineosaur
import XCTest

internal final class TreeTests: XCTestCase {
    private var sut: Graph?

    override internal func setUp() {
        sut = Graph()
    }

    override internal func tearDown() {
        sut = nil
    }

    private func testTreeGraphIsTree() {
        // given
        sut = treeGraph

        // when
        if let result: Bool = sut?.isTree {
            // then
            XCTAssertTrue(result)
        } else {
            XCTFail()
        }
    }

    private func testNonTreeGraphIsNotTree() {
        // given
        sut = notTreeGraph

        // when
        if let result: Bool = sut?.isTree {
            // then
            XCTAssertFalse(result)
        } else {
            XCTFail()
        }
    }

    private func testGraphWithoutEdgesIsTree() {
        // given
        sut?.insert("a")
        sut?.insert("b")
        sut?.insert("c")

        // when
        if let result: Bool = sut?.isTree {
            // then
            XCTAssertTrue(result)
        } else {
            XCTFail()
        }
    }

    private func testEmptyGraphIsTree() {
        // given

        // when
        if let result: Bool = sut?.isTree {
            // then
            XCTAssertTrue(result)
        } else {
            XCTFail()
        }
    }

    private func testDisconnectedGraphIsNotTree() {
        // given
        sut = disconnectedGraphNoOutlierVertex

        // when
        if let result: Bool = sut?.isTree {
            // then
            XCTAssertFalse(result)
        } else {
            XCTFail()
        }
    }
}
