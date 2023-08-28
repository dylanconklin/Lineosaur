//
//  Cell.swift
//  Adjacency Table
//
//  Created by Dylan Conklin on 7/31/23.
//

import SwiftUI

/// Displays information from graph
struct Cell<Content:View>: View {
    @ViewBuilder let content: Content

    var body: some View {
        content
            .frame(width: 150, height: 75)
            .border(.foreground)
    }
}

struct Cell_Previews: PreviewProvider {
    static var previews: some View {
        Cell {
            Text("-")
        }
    }
}
