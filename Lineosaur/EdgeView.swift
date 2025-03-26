//
//  EdgeView.swift
//  Adjacency Table
//
//  Created by Dylan Conklin on 8/1/23.
//

import SwiftUI

/// Displays information about a single edge
struct EdgeView: View {
    @Binding var edge: Edge

    var body: some View {
        Grid(alignment: .topLeading) {
            row(label: "From", value: "\(edge.from)")
            row(label: "To", value: "\(edge.toward)")
            row(
                label: "Weight",
                value: "\(edge.weight == edge.weight.rounded() ? String(Int(edge.weight)) : String(edge.weight))"
            )
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    private func row(label: String, value: String) -> some View {
        // Do not combine Text strings into a single value
        // They have to be separate so the Grid can space them out properly
        GridRow {
            Text(label)
            Text(":")
            Text(value)
        }
    }
}

#Preview {
    @Previewable @State var edge1: Edge = .init(from: "Destination", toward: "Destination", weight: 5.0)
    @Previewable @State var edge2: Edge = .init(from: "Destination", toward: "Destination", weight: 5.5)
    return VStack {
        EdgeView(edge: $edge1)
        EdgeView(edge: $edge2)
    }
}
