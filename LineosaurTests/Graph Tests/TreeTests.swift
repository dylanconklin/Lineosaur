//
//  Tree Tests.swift
//  LineosaurTests
//
//  Created by Dylan Conklin on 9/29/23.
//

@testable import Lineosaur
import Testing

@Suite
final class TreeTests {
    private var sut: Graph

    init() {
        sut = Graph()
    }

    internal func testTreeGraphIsTree() {
        // given
        sut = treeGraph

        // when
        #expect(sut.isTree == true)
    }

    internal func testNonTreeGraphIsNotTree() {
        // given
        sut = notTreeGraph

        // when
        #expect(sut.isTree == false)
    }

    internal func testGraphWithoutEdgesIsTree() {
        // given
        sut.insert("a")
        sut.insert("b")
        sut.insert("c")

        // when
        #expect(sut.isTree == true)
    }

    internal func testEmptyGraphIsTree() {
        // given

        // when
        #expect(sut.isTree == true)
    }

    internal func testDisconnectedGraphIsNotTree() {
        // given
        sut = disconnectedGraphNoOutlierVertex

        // when
        #expect(sut.isTree == false)
    }
}
