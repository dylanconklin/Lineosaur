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
        Grid (alignment: .leading) {
            GridRow {
                Text("From")
                Text(":")
                Text("\(edge.from)")
            }
            GridRow {
                Text("To")
                Text(":")
                Text("\(edge.to)")
            }
            GridRow {
                Text("Weight")
                Text(":")
                Text("\(edge.weight == edge.weight.rounded() ? String(Int(edge.weight)) : String(edge.weight))")
            }
        }
    }
}

#Preview {
    let x = "Destination"
    let y = 5.0
    let z = 5.5
    @State var edge1 = Edge(from: x, to: x, weight: y)
    @State var edge2 = Edge(from: x, to: x, weight: z)
    return VStack {
        EdgeView(edge: $edge1)
        EdgeView(edge: $edge2)
    }
}
