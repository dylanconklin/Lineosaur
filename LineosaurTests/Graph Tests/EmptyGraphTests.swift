//
//  Empty Graph Tests.swift
//  LineosaurTests
//
//  Created by Dylan Conklin on 9/16/23.
//

@testable import Lineosaur
import Testing

@Suite
struct EmptyGraphTests {
    private var sut: Graph

    init() {
        sut = Graph()
    }

    @Test
    func emptyGraphIsNotCyclic() {
        // given

        // when

        // then
        #expect(!sut.isCyclic)
    }

    @Test
    func emptyGraphIsConnected() {
        // given

        // when

        // then
        #expect(sut.isConnected)
    }
}
