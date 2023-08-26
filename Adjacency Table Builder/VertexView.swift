//
//  VertexView.swift
//  Adjacency Table Builder
//
//  Created by Dylan Conklin on 8/25/23.
//

import SwiftUI

/// Displays information about a single vertex
struct VertexView: View {
    @Binding var vertex: String

    var body: some View {
        HStack {
            Text(vertex)
            Spacer()
        }
    }
}

struct VertexView_Previews: PreviewProvider {
    @State static var vertex = "TestVertex"
    static var previews: some View {
        VertexView(vertex: $vertex)
    }
}
