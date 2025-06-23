// swiftlint:disable:this file_name
//
//  Modifiers.swift
//  Lineosaur
//
//  Created by Dylan Conklin on 6/14/24.
//

import Foundation

extension Graph {
    func deleteLeaves() {
        leaves.forEach(remove)
    }

    func deleteDetachedVertices() {
        vertices.filter { edges(connectedTo: $0).isEmpty }.forEach(remove)
    }
}
