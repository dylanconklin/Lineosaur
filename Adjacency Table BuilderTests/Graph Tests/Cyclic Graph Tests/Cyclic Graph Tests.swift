//
//  Cyclic Graph Tests.swift
//  Adjacency Table BuilderTests
//
//  Created by Dylan Conklin on 9/12/23.
//

import XCTest
@testable import Adjacency_Table_Builder

final class Cyclic_Graph_Tests: XCTestCase {
    
    var sut: Graph!

    override func setUp() {
        sut = [
            Edge(from: "1", to: "2", weight: 1),
            Edge(from: "2", to: "3", weight: 1),
            Edge(from: "2", to: "4", weight: 1),
            Edge(from: "4", to: "5", weight: 1),
            Edge(from: "5", to: "6", weight: 1),
            Edge(from: "6", to: "3", weight: 1),
            Edge(from: "6", to: "4", weight: 1),
        ]
    }

    override func tearDown() {
        sut = nil
    }

    func testExample() {
    }

}
