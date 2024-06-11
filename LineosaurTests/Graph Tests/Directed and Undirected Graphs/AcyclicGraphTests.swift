//
//  Acyclic Graph Tests.swift
//  LineosaurTests
//
//  Created by Dylan Conklin on 9/12/23.
//

@testable import Lineosaur
import Testing

struct AcyclicGraphTests {
    private var sut: Graph

    init() {
        sut = acyclicGraph
    }

    @Test
    func acyclicGraphIsNotCyclic() {
        // given

        // when
        #expect(!sut.isCyclic)
    }
}
