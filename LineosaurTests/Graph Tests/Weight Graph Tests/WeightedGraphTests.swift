//
//  Weighted Graph Tests.swift
//  LineosaurTests
//
//  Created by Dylan Conklin on 9/12/23.
//

@testable import Lineosaur
import Testing

@Suite
struct WeightedGraphTests {
    private var sut: Graph

    init() {
        sut = weightedGraph
    }

    @Test
    func mst() {
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
            Edge(from: "h", toward: "i", weight: 8),
        ])

        // when

        // then
        #expect(sut.mst.edges == expectedResult.edges)
    }
}
