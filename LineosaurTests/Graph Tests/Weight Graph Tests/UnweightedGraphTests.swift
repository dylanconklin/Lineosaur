//
//  Unweighted Graph Tests.swift
//  LineosaurTests
//
//  Created by Dylan Conklin on 9/12/23.
//

@testable import Lineosaur
import XCTest

internal final class UnweightedGraphTests: XCTestCase {
    private var sut: Graph!

    internal override func setUp() {
        sut = Graph()
    }

    internal override func tearDown() {
        sut = nil
    }
}
