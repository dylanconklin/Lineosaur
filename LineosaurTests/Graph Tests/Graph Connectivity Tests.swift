//
//  Graph Connectivity Tests.swift
//  LineosaurTests
//
//  Created by Dylan Conklin on 9/27/23.
//

@testable import Lineosaur
import XCTest

final class GraphConnectivityTests: XCTestCase {
    var sut: Graph!

    override func setUp() {}

    override func tearDown() {
        sut = nil
    }

    func testConnectedGraphIsConnected() {
        // given
        sut = connectedGraph

        // when
        let result: Bool = sut.isConnected

        // then
        XCTAssertTrue(result)
    }

    func testDisconnectedGraphWithoutOutlierVertexIsNotConnected() {
        // given
        sut = disconnectedGraphNoOutlierVertex

        // when
        let result: Bool = sut.isConnected

        // then
        XCTAssertFalse(result)
    }

    func testDisconnectedGraphWithOutlierVertexIsNotConnected() {
        // given
        sut = disconnectedGraphOutlierVertex

        // when
        let result: Bool = sut.isConnected

        // then
        XCTAssertFalse(result)
    }
}
