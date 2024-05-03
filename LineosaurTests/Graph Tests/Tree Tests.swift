//
//  Tree Tests.swift
//  LineosaurTests
//
//  Created by Dylan Conklin on 9/29/23.
//

@testable import Lineosaur
import XCTest

internal final class TreeTests: XCTestCase {
    var sut: Graph!

    override func setUp() {
        sut = Graph()
    }

    override func tearDown() {
        sut = nil
    }

    func testTreeGraphIsTree() {
        // given
        sut = treeGraph

        // when
        let result: Bool = sut.isTree

        // then
        XCTAssertTrue(result)
    }

    func testNonTreeGraphIsNotTree() {
        // given
        sut = notTreeGraph

        // when
        let result: Bool = sut.isTree

        // then
        XCTAssertFalse(result)
    }

    func testGraphWithoutEdgesIsTree() {
        // given
        sut.insert("a")
        sut.insert("b")
        sut.insert("c")

        // when
        let result: Bool = sut.isTree

        // then
        XCTAssertTrue(result)
    }

    func testEmptyGraphIsTree() {
        // given

        // when
        let result: Bool = sut.isTree

        // then
        XCTAssertTrue(result)
    }

    func testDisconnectedGraphIsNotTree() {
        // given
        sut = disconnectedGraphNoOutlierVertex

        // when
        let result: Bool = sut.isTree

        // then
        XCTAssertFalse(result)
    }
}
