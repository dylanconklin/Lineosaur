//
//  EdgeStyle.swift
//  Lineosaur
//
//  Created by Dylan Conklin on 3/23/24.
//

import Foundation

internal struct EdgeStyle: Codable {
    internal enum Arrow: String, CaseIterable, Codable {
        case box = "box"
        case crow = "crow"
        case curve = "curve"
        case diamond = "diamond"
        case dot = "dot"
        case inverse = "inv"
        case inverseCurve = "icurve"
        case plain = "none"
        case normal = "normal"
        case tee = "tee"
        case vee = "vee"

        internal var description: String {
            switch self {
            case .inverse:
                return "Inverse"
            case .inverseCurve:
                return "Inverse curve"
            default:
                return rawValue.capitalized
            }
        }
    }

    internal var arrowhead: Arrow = .normal
    internal var arrowtail: Arrow = .plain
}
