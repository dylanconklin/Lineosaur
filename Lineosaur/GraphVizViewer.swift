//
//  GraphVizViewer.swift
//  Lineosaur
//
//  Created by Dylan Conklin on 9/29/23.
//

import SwiftData
import SwiftUI

enum Compiler: String {
    case dot
    case fdp
    case neato
    case circo
    case twopi
    case osage
    case patchwork
}

struct GraphVizViewer: View {
    @Bindable var graph: Graph
    @State private var graphType: GraphType = .given
    @AppStorage("compiler") var compiler: Compiler = .dot
    
    private var directional: Bool {
        if graphType == .given { return true }
        else if graphType == .mst { return false }
        else { return false }
    }
    
    private var graphURL: URL { graph.generateGraphVizURL(of: graphType) }
    
    var body: some View {
        NavigationStack {
            VStack {
                if graph.isEmpty {
                    ContentUnavailableView("No graph to display", systemImage: "hammer", description: Text("Go to the Edit tab to add edges and vertices"))
                } else {
                    GraphViz(url: graphURL)
                }
                
                Spacer()
                    .navigationTitle("View Table")
                    .toolbar {
                        if !graph.isEmpty {
                            ToolbarItem(placement: .topBarTrailing) {
                                Menu {
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
                                    ShareLink("Share", item: graphURL)
                                } label: {
                                    Label("Menu", systemImage: "ellipsis.circle")
                                }
                            }
                        }
                    }
            }
        }
    }
}


#Preview("Empty Graph") {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Graph.self, configurations: config)
        return GraphVizViewer(graph: Graph())
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container")
    }
}

#Preview("Non-Empty Graph") {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Graph.self, configurations: config)
        return GraphVizViewer(graph: connected_graph)
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container")
    }
}
