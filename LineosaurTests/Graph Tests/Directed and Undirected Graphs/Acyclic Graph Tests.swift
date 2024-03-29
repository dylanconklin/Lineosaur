//
//  Acyclic Graph Tests.swift
//  LineosaurTests
//
//  Created by Dylan Conklin on 9/12/23.
//

@testable import Lineosaur
import XCTest

final class AcyclicGraphTests: XCTestCase {
    var sut: Graph!

    override func setUp() {
        sut = acyclicGraph
    }

    override func tearDown() {
        sut = nil
    }

    func testAcyclicGraphIsNotCyclic() {
        // given

        // when
        let result: Bool = sut.isCyclic

        // then
        XCTAssertFalse(result)
    }
}
