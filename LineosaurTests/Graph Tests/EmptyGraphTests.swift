//
//  Empty Graph Tests.swift
//  LineosaurTests
//
//  Created by Dylan Conklin on 9/16/23.
//

@testable import Lineosaur
import XCTest

internal final class EmptyGraphTests: XCTestCase {
    private var sut: Graph?

    override internal func setUp() {
        sut = Graph()
    }

    override internal func tearDown() {
        sut = nil
    }

    internal func testEmptyGraphIsNotCyclic() {
        // given

        // when
        if let result: Bool = sut?.isCyclic {
            // then
            XCTAssertFalse(result)
        } else {
            XCTFail("isCyclic didn't produce a value")
        }
    }

    internal func testEmptyGraphIsConnected() {
        // given

        // when
        if let result: Bool = sut?.isConnected {
            // then
            XCTAssertTrue(result)
        } else {
            XCTFail("isConnected didn't produce a value")
        }
    }
}
