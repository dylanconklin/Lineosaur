//
//  GraphViz.swift
//  Adjacency Table Builder
//
//  Created by Dylan Conklin on 9/29/23.
//

import SwiftUI

struct GraphViz: View {
    var url: URL

    @GestureState private var scale: Double = 1.0

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
    GraphViz(url: weighted_graph.generateGraphVizURL(directional: true))
}
