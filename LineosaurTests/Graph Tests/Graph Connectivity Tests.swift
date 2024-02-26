//
//  Graph Connectivity Tests.swift
//  LineosaurTests
//
//  Created by Dylan Conklin on 9/27/23.
//

import XCTest
@testable import Lineosaur

final class Graph_Connectivity_Tests: XCTestCase {

    var sut: Graph!

    override func setUp() {
    }

    override func tearDown() {
        sut = nil
    }

    func testConnectedGraphIsConnected() {
        // given
        sut = connected_graph

        // when
        let result: Bool = sut.isConnected

        // then
        XCTAssertTrue(result)
    }

    func testDisconnectedGraphWithoutOutlierVertexIsNotConnected() {
        // given
        sut = disconnected_graph_no_outlier_vertex

        // when
        let result: Bool = sut.isConnected

        // then
        XCTAssertFalse(result)
    }

    func testDisconnectedGraphWithOutlierVertexIsNotConnected() {
        // given
        sut = disconnected_graph_outlier_vertex

        // when
        let result: Bool = sut.isConnected

        // then
        XCTAssertFalse(result)
    }
}
