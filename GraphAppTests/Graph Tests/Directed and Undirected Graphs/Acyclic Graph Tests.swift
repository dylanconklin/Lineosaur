//
//  Acyclic Graph Tests.swift
//  Adjacency Table BuilderTests
//
//  Created by Dylan Conklin on 9/12/23.
//

import XCTest
@testable import Adjacency_Table_Builder

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
