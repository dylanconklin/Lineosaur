//
//  Acyclic Graph Tests.swift
//  LineosaurTests
//
//  Created by Dylan Conklin on 9/12/23.
//

@testable import Lineosaur
import XCTest

internal final class AcyclicGraphTests: XCTestCase {
    private var sut: Graph!

    internal override func setUp() {
        sut = acyclicGraph
    }

    internal override func tearDown() {
        sut = nil
    }

    private func testAcyclicGraphIsNotCyclic() {
        // given

        // when
        let result: Bool = sut.isCyclic

        // then
        XCTAssertFalse(result)
    }
}
