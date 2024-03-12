//
//  VertexView.swift
//  Lineosaur
//
//  Created by Dylan Conklin on 8/25/23.
//

import SwiftUI

/// Displays information about a single vertex
struct VertexView: View {
    @Binding var vertex: Vertex

    var body: some View {
        HStack {
            Text(vertex.name)
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
            Image(systemName: "smallcircle.filled.circle")
        }
    }
}

#Preview {
    @State var vertex = Vertex(name: "TestVertex")
    return VertexView(vertex: $vertex)
}
