//
//  GraphVizViewer.swift
//  Lineosaur
//
//  Created by Dylan Conklin on 9/29/23.
//

import SwiftData
import SwiftUI

enum Compiler: String {
    case circo
    case dot
    case fdp
    case neato
    case osage
    case patchwork
    case twopi
}

struct GraphVizViewer: View {
    @Bindable var graph: Graph
    @State private var graphType: GraphType = .given
    @AppStorage("compiler")
    private var compiler: Compiler = .dot
    @AppStorage("displayEdgeWeights")
    private var displayEdgeWeights: Bool = .init(false)

    private var graphURL: URL? { graph.generateGraphVizURL(of: graphType) }

    var toolBarMenu: some View {
        Menu("Menu", systemImage: "ellipsis.circle") {
            Menu("Graph Type", systemImage: "square.on.circle") {
                Picker("Graph Type", selection: $graphType) {
                    Text("Given").tag(GraphType.given)
                    Text("MST").tag(GraphType.mst)
                }
            }
            Menu("Compiler", systemImage: "brain") {
                Picker("Compiler", selection: $compiler) {
                    Text("Dot").tag(Compiler.dot)
                    Text("FDP").tag(Compiler.fdp)
                    Text("Neato").tag(Compiler.neato)
                    Text("Circo").tag(Compiler.circo)
                    Text("TwoPi").tag(Compiler.twopi)
                    Text("Osage").tag(Compiler.osage)
                    Text("Patchwork").tag(Compiler.patchwork)
                }
            }
            Menu("Display", systemImage: "eye") {
                Toggle("Edge Weights", isOn: $displayEdgeWeights)
            }
            if let url: URL = graphURL {
                ShareLink("Share", item: url)
            }
        }
    }

    var body: some View {
        NavigationStack {
            VStack {
                if graph.isEmpty {
                    ContentUnavailableView(
                        "No graph to display",
                        systemImage: "hammer",
                        description: Text("Go to the Edit tab to add edges and vertices")
                    )
                } else {
                    GraphViz(url: graphURL)
                }

                Spacer()
                    .navigationTitle("View Table")
                    .toolbar {
                        if !graph.isEmpty {
                            ToolbarItem(placement: .topBarTrailing) {
                                toolBarMenu
                            }
                        }
                    }
            }
        }
    }
}

#Preview("Empty Graph") {
    do {
        let config: ModelConfiguration = .init(isStoredInMemoryOnly: true)
        let container: ModelContainer = try .init(for: Graph.self, configurations: config)
        return GraphVizViewer(graph: Graph())
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container")
    }
}

#Preview("Non-Empty Graph") {
    do {
        let config: ModelConfiguration = .init(isStoredInMemoryOnly: true)
        let container: ModelContainer = try .init(for: Graph.self, configurations: config)
        return GraphVizViewer(graph: graph2)
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container")
    }
}
