//
//  Graph Connectivity Tests.swift
//  LineosaurTests
//
//  Created by Dylan Conklin on 9/27/23.
//

@testable import Lineosaur
import XCTest

internal final class GraphConnectivityTests: XCTestCase {
    private var sut: Graph?

    internal override func setUp() {
        sut = Graph()
    }

    internal override func tearDown() {
        sut = nil
    }

    private func testConnectedGraphIsConnected() {
        // given
        sut = connectedGraph

        // when
        if let result: Bool = sut?.isConnected {
            // then
            XCTAssertTrue(result)
        } else {
            XCTFail()
        }
    }

    private func testDisconnectedGraphWithoutOutlierVertexIsNotConnected() {
        // given
        sut = disconnectedGraphNoOutlierVertex

        // when
        if let result: Bool = sut?.isConnected {
            // then
            XCTAssertFalse(result)
        } else {
            XCTFail()
        }
    }

    private func testDisconnectedGraphWithOutlierVertexIsNotConnected() {
        // given
        sut = disconnectedGraphOutlierVertex

        // when
        if let result: Bool = sut?.isConnected {
            // then
            XCTAssertFalse(result)
        } else {
            XCTFail()
        }
    }
}
