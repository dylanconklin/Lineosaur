//
//  Cyclic Graph Tests.swift
//  LineosaurTests
//
//  Created by Dylan Conklin on 9/12/23.
//

@testable import Lineosaur
import Testing

@Suite
struct CyclicGraphTests {
    private var sut: Graph

    init() {
        sut = cyclicGraph
    }

    @Test
    func cyclicGraphIsCyclic() {
        // given

        // when
        #expect(sut.isCyclic)
    }
}
