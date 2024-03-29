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
        case box
        case crow
        case curve
        case diamond
        case dot
        case inverse = "inv"
        case inverseCurve = "icurve"
        case none
        case normal
        case tee
        case vee

        var description: String {
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
}
