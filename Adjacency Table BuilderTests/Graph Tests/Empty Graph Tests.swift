//
//  Empty Graph Tests.swift
//  Adjacency Table BuilderTests
//
//  Created by Dylan Conklin on 9/16/23.
//

import XCTest
@testable import Adjacency_Table_Builder

final class Empty_Graph_Tests: XCTestCase {
    
    var sut: Graph!

    override func setUp() {
        sut = []
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

}
