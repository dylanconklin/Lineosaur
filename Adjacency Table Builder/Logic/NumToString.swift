//
//  NumToString.swift
//  Adjacency Table Builder
//
//  Created by Dylan Conklin on 10/11/23.
//

import Foundation

func numToString(_ num: Double) -> String {
    return floor(num) == num ? numToString(Int(num)) : String(num)
}

func numToString(_ num: Int) -> String {
    return String(num)
}
