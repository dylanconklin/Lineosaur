//
//  Cell.swift
//  Adjacency Table
//
//  Created by Dylan Conklin on 7/31/23.
//

import SwiftUI

/// Displays information from graph
internal struct Cell<Content: View>: View {
    @ViewBuilder internal let content: Content

    internal var body: some View {
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
