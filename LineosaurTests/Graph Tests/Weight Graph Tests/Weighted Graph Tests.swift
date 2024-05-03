//
//  Weighted Graph Tests.swift
//  LineosaurTests
//
//  Created by Dylan Conklin on 9/12/23.
//

@testable import Lineosaur
import XCTest

internal final class WeightedGraphTests: XCTestCase {
    var sut: Graph!

    override func setUp() {
        sut = weightedGraph
    }

    override func tearDown() {
        sut = nil
    }

    func testMST() {
        // given
        let expectedResult: Graph = .init(graphEdges: [
            Edge(from: "a", toward: "b", weight: 1),
            Edge(from: "b", toward: "c", weight: 2),
            Edge(from: "a", toward: "d", weight: 22),
            Edge(from: "d", toward: "f", weight: 11),
            Edge(from: "d", toward: "g", weight: 16),
            Edge(from: "e", toward: "g", weight: 6),
            Edge(from: "f", toward: "k", weight: 28),
            Edge(from: "j", toward: "k", weight: 5),
            Edge(from: "i", toward: "j", weight: 13),
            Edge(from: "h", toward: "i", weight: 8)
        ])

        // when
        let actualResult: Graph = sut.mst

        // then
        XCTAssertEqual(actualResult.edges, expectedResult.edges)
    }
}
