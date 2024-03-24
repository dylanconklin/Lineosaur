//
//  EdgeStyle.swift
//  Lineosaur
//
//  Created by Dylan Conklin on 3/23/24.
//

import Foundation

struct EdgeStyle: Codable {
    var arrowhead: Arrow = .normal
    var arrowtail: Arrow = EdgeStyle.Arrow.none

    enum Arrow: String, CaseIterable, Codable {
        case box = "box"
        case crow = "crow"
        case curve = "curve"
        case diamond = "diamond"
        case dot = "dot"
        case inverse = "inv"
        case inverse_curve = "icurve"
        case none = "none"
        case normal = "normal"
        case tee = "tee"
        case vee = "vee"

        var description: String {
            switch self {
            case .inverse:
                return "Inverse"
            case .inverse_curve:
                return "Inverse curve"
            default:
                return self.rawValue.capitalized
            }
        }
    }
}
