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
        .padding()
    }
}

struct EdgeView_Previews: PreviewProvider {
    static var x = "Destination"
    static var y = 5.0
    static var z = 5.5
    @State static var edge1 = Edge(from: x, to: x, weight: y)
    @State static var edge2 = Edge(from: x, to: x, weight: z)
    static var previews: some View {
        VStack {
            EdgeView(edge: $edge1)
            EdgeView(edge: $edge2)
        }
    }
}
