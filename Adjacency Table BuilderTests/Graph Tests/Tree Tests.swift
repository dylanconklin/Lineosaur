//
//  Tree Tests.swift
//  Adjacency Table BuilderTests
//
//  Created by Dylan Conklin on 9/29/23.
//

import XCTest
@testable import Adjacency_Table_Builder

final class Tree_Tests: XCTestCase {

    var sut: Graph!

    override func setUp() {
        sut = Graph()
    }

    override func tearDown() {
        sut = nil
    }

    func testTreeGraphIsTree () {
        // given
        sut = tree_graph

        // when
        let result = sut.isTree

        // then
        XCTAssertTrue(result)
    }

    func testNonTreeGraphIsNotTree () {
        // given
        sut = not_tree_graph

        // when
        let result = sut.isTree

        // then
        XCTAssertFalse(result)
    }

    func testGraphWithoutEdgesIsTree () {
        // given
        sut.insert("a")
        sut.insert("b")
        sut.insert("c")

        // when
        let result = sut.isTree

        // then
        XCTAssertTrue(result)
    }

    func testEmptyGraphIsTree () {
        // given

        // when
        let result = sut.isTree

        // then
        XCTAssertTrue(result)
    }

    func testDisconnectedGraphIsNotTree () {
        // given
        sut = disconnected_graph_no_outlier_vertex

        // when
        let result = sut.isTree

        // then
        XCTAssertFalse(result)
    }
}
