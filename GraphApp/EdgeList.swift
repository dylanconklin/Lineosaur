//
//  EdgeList.swift
//  Adjacency Table
//
//  Created by Dylan Conklin on 8/4/23.
//

import SwiftData
import SwiftUI

/// List showing edges in the graph
struct EdgeList: View {
    @Bindable var graph: Graph
    
    var body: some View {
        ZStack {
            if graph.edges.isEmpty {
                VStack {
                    Spacer()
                    Text("Tap on + to add an edge to your graph")
                        .font(Comfortaa.body)
                        .frame(alignment: .center)
                        .multilineTextAlignment(.center)
                    Spacer()
                }
            } else {
                List {
                    ForEach($graph.edges, id: \.id, editActions: .delete) { edge in
                        EdgeView(edge: edge)
                            .contextMenu {
                                Button {
                                    graph.remove(edge.wrappedValue)
                                    graph.insert(edge.wrappedValue.copy)
                                } label: {
                                    Label("Flip Direction", systemImage: "arrow.left.arrow.right")
                                }
                                Button {
                                    graph.insert(edge.wrappedValue.copy)
                                } label: {
                                    Label("Duplicate", systemImage: "plus.square.on.square")
                                }
                            }
                    }
                }
            }
        }
    }
}

#Preview("Empty List") {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Graph.self, configurations: config)
        return EdgeList(graph: Graph())
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container")
    }
}

#Preview("Non-Empty List") {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Graph.self, configurations: config)
        return EdgeList(graph: connected_graph)
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container")
    }
}
