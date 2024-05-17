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

    override internal func setUp() {
        sut = Graph()
    }

    override internal func tearDown() {
        sut = nil
    }

    internal func testConnectedGraphIsConnected() {
        // given
        sut = connectedGraph

        // when
        if let result: Bool = sut?.isConnected {
            // then
            XCTAssertTrue(result)
        } else {
            XCTFail("isConnected didn't produce a value")
        }
    }

    internal func testDisconnectedGraphWithoutOutlierVertexIsNotConnected() {
        // given
        sut = disconnectedGraphNoOutlierVertex

        // when
        if let result: Bool = sut?.isConnected {
            // then
            XCTAssertFalse(result)
        } else {
            XCTFail("isConnected didn't produce a value")
        }
    }

    internal func testDisconnectedGraphWithOutlierVertexIsNotConnected() {
        // given
        sut = disconnectedGraphOutlierVertex

        // when
        if let result: Bool = sut?.isConnected {
            // then
            XCTAssertFalse(result)
        } else {
            XCTFail("isConnected didn't produce a value")
        }
    }
}
