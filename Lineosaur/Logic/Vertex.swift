//
//  Vertex.swift
//  Lineosaur
//
//  Created by Dylan Conklin on 3/11/24.
//

import Foundation
import SwiftUI

struct Vertex: Codable, Comparable, Equatable, Hashable {
    var name: String = ""
    var fillColor: [CGFloat] = [1.0, 1.0, 1.0, 1.0]

    static func == (lhs: Vertex, rhs: Vertex) -> Bool {
        lhs.name == rhs.name
    }

    static func < (lhs: Vertex, rhs: Vertex) -> Bool {
        lhs.name < rhs.name
    }
}
