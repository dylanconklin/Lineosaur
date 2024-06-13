//
//  VertexSelector.swift
//  Lineosaur
//
//  Created by Dylan Conklin on 6/12/24.
//

import SwiftUI

struct VertexSelector: View {
    var prompt: String
    @Binding var value: String
    var selection: [String]

    var body: some View {
        Text(prompt)
        Text(":")
        HStack {
            TextField(prompt, text: $value)
            if !selection.isEmpty {
                Menu {
                    ForEach(selection, id: \.self) { val in
                        Button(val) {
                            value = val
                        }
                    }
                } label: {
                    Label("Select Existing Vertex", systemImage: "ellipsis")
                        .labelStyle(.iconOnly)
                }
            }
        }
    }
}
