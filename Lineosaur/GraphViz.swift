//
//  GraphViz.swift
//  Lineosaur
//
//  Created by Dylan Conklin on 9/29/23.
//

import SwiftData
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
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Graph.self, configurations: config)
        return GraphViz(url: weighted_graph.generateGraphVizURL(of: .given))
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container")
    }
}
