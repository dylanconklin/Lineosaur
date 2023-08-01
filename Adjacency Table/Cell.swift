//
//  Cell.swift
//  Adjacency Table
//
//  Created by Dylan Conklin on 7/31/23.
//

import SwiftUI

struct Cell: View {
    var str: String = "-"

    var body: some View {
        Text(str)
            .frame(width: 150, height: 75)
            .border(.foreground)
    }
}

struct Cell_Previews: PreviewProvider {
    static var previews: some View {
        Cell()
    }
}
