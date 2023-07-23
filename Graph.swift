//
//  Graph.swift
//  Adjacency Table
//
//  Created by Dylan Conklin on 7/21/23.
//

import Foundation

typealias Vertex = String
typealias Graph = [Set<Vertex> : Double]

extension Set {
    func containsAny (in set: Set) -> Bool {
        var result: Bool = false
        for element in set {
            if self.contains(element) {
                result = true
            }
        }
        return result
    }
}
