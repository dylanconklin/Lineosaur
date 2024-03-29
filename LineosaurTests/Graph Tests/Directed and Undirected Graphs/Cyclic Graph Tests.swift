//
//  Cyclic Graph Tests.swift
//  LineosaurTests
//
//  Created by Dylan Conklin on 9/12/23.
//

import XCTest
@testable import Lineosaur

final class CyclicGraphTests: XCTestCase {

    var sut: Graph!

    override func setUp() {
        sut = cyclicGraph
    }

    override func tearDown() {
        sut = nil
    }

    func testCyclicGraphIsCyclic() {
        // given

        // when
        let result: Bool = sut.isCyclic

        // then
        XCTAssertTrue(result)
    }
}
