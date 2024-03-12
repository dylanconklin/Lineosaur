//
//  VertexView.swift
//  Lineosaur
//
//  Created by Dylan Conklin on 8/25/23.
//

import SwiftUI

/// Displays information about a single vertex
struct VertexView: View {
    @Binding var vertex: String
    
    var body: some View {
        Text(vertex)
            .frame(maxWidth: .infinity, alignment: .leading)
            .multilineTextAlignment(.leading)
    }
}

#Preview {
    @State var vertex = "TestVertex"
    return VertexView(vertex: $vertex)
}
