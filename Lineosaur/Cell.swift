//
//  Cell.swift
//  Adjacency Table
//
//  Created by Dylan Conklin on 7/31/23.
//

import SwiftUI

/// Displays information from graph
internal struct Cell<Content: View>: View {
    @ViewBuilder let content: Content

    var body: some View {
        content
            .padding()
            .padding()
            .frame(maxWidth: .infinity)
            .border(.foreground)
    }
}

#Preview {
    Cell {
        Text("-")
    }
}
