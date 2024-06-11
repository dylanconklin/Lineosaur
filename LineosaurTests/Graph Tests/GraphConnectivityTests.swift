//
//  Graph Connectivity Tests.swift
//  LineosaurTests
//
//  Created by Dylan Conklin on 9/27/23.
//

@testable import Lineosaur
import XCTest

final class GraphConnectivityTests: XCTestCase {
    private var sut: Graph?

    override func setUp() {
        sut = Graph()
    }

    override func tearDown() {
        sut = nil
    }

    func testConnectedGraphIsConnected() {
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

    func testDisconnectedGraphWithoutOutlierVertexIsNotConnected() {
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

    func testDisconnectedGraphWithOutlierVertexIsNotConnected() {
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
