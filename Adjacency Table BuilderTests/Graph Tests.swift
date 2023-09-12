//
//  Graph Tests.swift
//  Adjacency Table BuilderTests
//
//  Created by Dylan Conklin on 9/11/23.
//

import XCTest
@testable import Adjacency_Table_Builder

final class Graph_Tests: XCTestCase {
    
    let acyclic_graph: Graph = [
        Edge(from: "1", to: "2", weight: 1),
        Edge(from: "2", to: "3", weight: 1),
        Edge(from: "2", to: "4", weight: 1),
        Edge(from: "4", to: "5", weight: 1),
        Edge(from: "4", to: "6", weight: 1),
        Edge(from: "5", to: "6", weight: 1),
        Edge(from: "6", to: "3", weight: 1),
    ]

    let cyclic_graph: Graph = [
        Edge(from: "1", to: "2", weight: 1),
        Edge(from: "2", to: "3", weight: 1),
        Edge(from: "2", to: "4", weight: 1),
        Edge(from: "4", to: "5", weight: 1),
        Edge(from: "5", to: "6", weight: 1),
        Edge(from: "6", to: "3", weight: 1),
        Edge(from: "6", to: "4", weight: 1),
    ]

    var cities: Graph = [
        Edge(from: "Baltimore", to: "Barre", weight: 496),
        Edge(from: "Baltimore", to: "Portland", weight: 2810),
        Edge(from: "Baltimore", to: "Richmond", weight: 149),
        Edge(from: "Baltimore", to: "SLC", weight: 2082),
        Edge(from: "Barre", to: "Portland", weight: 3052),
        Edge(from: "Barre", to: "Richmond", weight: 646),
        Edge(from: "Barre", to: "SLC", weight: 2328),
        Edge(from: "Portland", to: "Richmond", weight: 2867),
        Edge(from: "Portland", to: "SLC", weight: 768),
        Edge(from: "Richmond", to: "SLC", weight: 2141),
    ]
    
    var sut: Graph!

    override func setUp() {
    }

    override func tearDown() {
    }

    func testAcyclicGraphIsNotCyclic() {
        // given
        sut = acyclic_graph
        
        // when
        let result: Bool = sut.isCyclic
        
        // then
        XCTAssertFalse(result)
    }
    
    func testCyclicGraphIsCyclic() {
        // given
        sut = cyclic_graph
        
        // when
        let result: Bool = sut.isCyclic
        
        // then
        XCTAssertTrue(result)
    }
    
    func testEmptyGraphIsNotCyclic() {
        // given
        sut = []
        
        // when
        let result: Bool = sut.isCyclic
        
        // then
        XCTAssertFalse(result)
    }
    
    func testMSTCities() {
        // given
        sut = cities
        let expectedResult: Graph = [
            Edge(from: "Baltimore", to: "Barre", weight: 496),
            Edge(from: "Baltimore", to: "Richmond", weight: 149),
            Edge(from: "Baltimore", to: "SLC", weight: 2082),
            Edge(from: "Portland", to: "SLC", weight: 768),
        ]
        
        // when
        let actualResult: Graph = sut.mst
        
        // then
        XCTAssertEqual(actualResult, expectedResult)
    }
}
