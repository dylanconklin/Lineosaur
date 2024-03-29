//
//  Empty Graph Tests.swift
//  LineosaurTests
//
//  Created by Dylan Conklin on 9/16/23.
//

@testable import Lineosaur
import XCTest

final class EmptyGraphTests: XCTestCase {
    var sut: Graph!

    override func setUp() {
        sut = Graph()
    }

    override func tearDown() {
        sut = nil
    }

    func testEmptyGraphIsNotCyclic() {
        // given

        // when
        let result: Bool = sut.isCyclic

        // then
        XCTAssertFalse(result)
    }

    func testEmptyGraphIsConnected() {
        // given

        // when
        let result: Bool = sut.isConnected

        // then
        XCTAssertTrue(result)
    }
}
