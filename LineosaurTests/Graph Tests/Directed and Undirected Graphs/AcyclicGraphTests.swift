//
//  Acyclic Graph Tests.swift
//  LineosaurTests
//
//  Created by Dylan Conklin on 9/12/23.
//

@testable import Lineosaur
import XCTest

internal final class AcyclicGraphTests: XCTestCase {
    private var sut: Graph?

    override internal func setUp() {
        sut = acyclicGraph
    }

    override internal func tearDown() {
        sut = nil
    }

    internal func testAcyclicGraphIsNotCyclic() {
        // given

        // when
        if let result: Bool = sut?.isCyclic {
            // then
            XCTAssertFalse(result)
        } else {
            XCTFail("isCyclic didn't produce a value")
        }
    }
}
