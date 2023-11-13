//
//  GraphViz.swift
//  Adjacency Table Builder
//
//  Created by Dylan Conklin on 9/29/23.
//

import SwiftUI

struct GraphViz: View {
    var graph: Graph
    var directional: Bool

    @GestureState private var scale: Double = 1.0

    private var url: URL {
        URL(string:
                graph.generateGraphViz(directional: directional)
        )!
    }

    private var magnification: some Gesture {
        MagnifyGesture()
            .updating($scale) { _, _, _ in }
    }

    var body: some View {
        VStack {
            AsyncImage(url: url) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .scaleEffect(scale)
                    .gesture(magnification)
            } placeholder: {
                ProgressView()
            }
        }
    }
}

#Preview {
    GraphViz(graph: weighted_graph, directional: false)
}
