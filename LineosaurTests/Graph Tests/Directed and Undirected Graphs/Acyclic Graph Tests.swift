//
//  Acyclic Graph Tests.swift
//  LineosaurTests
//
//  Created by Dylan Conklin on 9/12/23.
//

import XCTest
@testable import Lineosaur

final class Acyclic_Graph_Tests: XCTestCase {
    
    var sut: Graph!

    override func setUp() {
        sut = acyclic_graph
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
