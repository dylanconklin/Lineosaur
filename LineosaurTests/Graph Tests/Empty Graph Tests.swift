//
//  Empty Graph Tests.swift
//  LineosaurTests
//
//  Created by Dylan Conklin on 9/16/23.
//

@testable import Lineosaur
import XCTest

internal final class EmptyGraphTests: XCTestCase {
    private var sut: Graph!

    internal override func setUp() {
        sut = Graph()
    }

    internal override func tearDown() {
        sut = nil
    }

    private func testEmptyGraphIsNotCyclic() {
        // given

        // when
        let result: Bool = sut.isCyclic

        // then
        XCTAssertFalse(result)
    }

    private func testEmptyGraphIsConnected() {
        // given

        // when
        let result: Bool = sut.isConnected

        // then
        XCTAssertTrue(result)
    }
}
