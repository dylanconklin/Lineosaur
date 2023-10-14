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
    var url: URL {
        URL(string:
            graph.generateGraphViz(directional: directional)
        )!
    }

    var body: some View {
        VStack {
            AsyncImage(url: url) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
        }
    }
}

#Preview {
    GraphViz(graph: weighted_graph, directional: false)
}
