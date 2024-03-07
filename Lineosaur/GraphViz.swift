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

    @State private var currScale: CGFloat = 1.0
    @State private var changingScale: CGFloat = 1.0

    @State private var currOffSet: CGPoint = CGPoint()
    @State private var changingOffSet: CGPoint = CGPoint()

    private var move: some Gesture {
        DragGesture()
            .onChanged { x in
                changingOffSet = CGPoint(x: x.translation.width, y: x.translation.height)
            }
            .onEnded { x in
                currOffSet.x = currOffSet.x + changingOffSet.x
                currOffSet.y = currOffSet.y + changingOffSet.y
                changingOffSet = CGPoint(x: 0.0, y: 0.0)
            }
    }

    private var magnification: some Gesture {
        MagnifyGesture()
            .onChanged { v in
                changingScale = v.magnification
            }
            .onEnded { v in
                currScale *= v.magnification
                changingScale = 1.0
            }
    }

    var body: some View {
        VStack {
            AsyncImage(url: url) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .scaleEffect(currScale * changingScale)
                    .offset(x: currOffSet.x + changingOffSet.x, y: currOffSet.y + changingOffSet.y)
                    .gesture(move)
                    .gesture(magnification)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .clipped()
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
