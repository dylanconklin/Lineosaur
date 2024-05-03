//
//  Cyclic Graph Tests.swift
//  LineosaurTests
//
//  Created by Dylan Conklin on 9/12/23.
//

@testable import Lineosaur
import XCTest

internal final class CyclicGraphTests: XCTestCase {
    private var sut: Graph!

    internal override func setUp() {
        sut = cyclicGraph
    }

    internal override func tearDown() {
        sut = nil
    }

    private func testCyclicGraphIsCyclic() {
        // given

        // when
        let result: Bool = sut.isCyclic

        // then
        XCTAssertTrue(result)
    }
}
