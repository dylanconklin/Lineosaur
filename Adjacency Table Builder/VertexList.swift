//
//  VertexList.swift
//  Adjacency Table Builder
//
//  Created by Dylan Conklin on 8/25/23.
//

import SwiftUI

struct VertexList: View {
    @Binding var vertices: [Vertex]
    @State var showVertexBuilder: Bool = false
    @State var vertexName: String = ""

    var body: some View {
        NavigationStack {
            List {
                ForEach ($vertices, id: \.self, editActions: .delete) { vertex in
                    VertexView(vertex: vertex)
                }
            }
            .navigationTitle("Vertices")
            .toolbar {
                EditButton()
                Button {
                    showVertexBuilder = true
                } label: {
                    Image(systemName: "plus")
                }
                .alert("Add Vertex", isPresented: $showVertexBuilder) {
                    TextField("Add Vertex", text: $vertexName, prompt: Text("Vertex Name"))
                    Button ("Cancel", role: .cancel) {
                        showVertexBuilder = false
                        vertexName = ""
                    }
                    Button ("Add") {
                        vertices.append(vertexName)
                        vertexName = ""
                    }
                }
            }
        }
    }
}

#Preview {
    @State var vertices: [Vertex] = ["a", "b", "c"]
    return VertexList(vertices: $vertices)
}
