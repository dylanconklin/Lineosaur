//
//  EdgeView.swift
//  Adjacency Table
//
//  Created by Dylan Conklin on 8/1/23.
//

import SwiftUI

/// Displays information about a single edge
internal struct EdgeView: View {
    @Binding var edge: Edge

    var body: some View {
        Grid(alignment: .topLeading) {
            GridRow {
                Text("From")
                Text(":")
                Text("\(edge.from)")
            }
            GridRow {
                Text("To")
                Text(":")
                Text("\(edge.toward)")
            }
            GridRow {
                Text("Weight")
                Text(":")
                Text("\(edge.weight == edge.weight.rounded() ? String(Int(edge.weight)) : String(edge.weight))")
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    let vertex: String = "Destination"
    let lengthA: Double = 5.0
    let lengthB: Double = 5.5
    @State var edge1: Edge = .init(from: vertex, toward: vertex, weight: lengthA)
    @State var edge2: Edge = .init(from: vertex, toward: vertex, weight: lengthB)
    return VStack {
        EdgeView(edge: $edge1)
        EdgeView(edge: $edge2)
    }
}
