//
//  Cyclic Graph Tests.swift
//  LineosaurTests
//
//  Created by Dylan Conklin on 9/12/23.
//

@testable import Lineosaur
import XCTest

internal final class CyclicGraphTests: XCTestCase {
    private var sut: Graph?

    override internal func setUp() {
        sut = cyclicGraph
    }

    override internal func tearDown() {
        sut = nil
    }

    internal func testCyclicGraphIsCyclic() {
        // given

        // when
        if let result: Bool = sut?.isCyclic {
            // then
            XCTAssertTrue(result)
        } else {
            XCTFail()
        }
    }
}
