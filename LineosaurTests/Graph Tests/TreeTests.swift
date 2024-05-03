//
//  Tree Tests.swift
//  LineosaurTests
//
//  Created by Dylan Conklin on 9/29/23.
//

@testable import Lineosaur
import XCTest

internal final class TreeTests: XCTestCase {
    private var sut: Graph!

    internal override func setUp() {
        sut = Graph()
    }

    internal override func tearDown() {
        sut = nil
    }

    private func testTreeGraphIsTree() {
        // given
        sut = treeGraph

        // when
        let result: Bool = sut.isTree

        // then
        XCTAssertTrue(result)
    }

    private func testNonTreeGraphIsNotTree() {
        // given
        sut = notTreeGraph

        // when
        let result: Bool = sut.isTree

        // then
        XCTAssertFalse(result)
    }

    private func testGraphWithoutEdgesIsTree() {
        // given
        sut.insert("a")
        sut.insert("b")
        sut.insert("c")

        // when
        let result: Bool = sut.isTree

        // then
        XCTAssertTrue(result)
    }

    private func testEmptyGraphIsTree() {
        // given

        // when
        let result: Bool = sut.isTree

        // then
        XCTAssertTrue(result)
    }

    private func testDisconnectedGraphIsNotTree() {
        // given
        sut = disconnectedGraphNoOutlierVertex

        // when
        let result: Bool = sut.isTree

        // then
        XCTAssertFalse(result)
    }
}
