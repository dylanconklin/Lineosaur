//
//  GraphFacts.swift
//  Adjacency Table Builder
//
//  Created by Dylan Conklin on 9/11/23.
//

import SwiftUI

struct GraphFact: View {
    var fact: String
    var symbol: String
    
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: symbol)
                .font(.system(size: 64))
            Spacer()
            Text(fact)
            Spacer()
        }
    }
}

struct GraphFacts: View {
    var graph: Graph
    
    var body: some View {
        TabView {
            GraphFact(fact: "The cost is \(graph.cost)",
                      symbol: "dollarsign")
            .tabItem(){
            }
            GraphFact(fact: "The graph is \(graph.isCyclic ? "" : "a")cyclic",
                      symbol: "arrow.triangle.2.circlepath")
            .tabItem(){
            }
            GraphFact(fact: "The graph has \(graph.vertices.count) vertices",
                      symbol: "smallcircle.circle")
            .tabItem(){
            }
            GraphFact(fact: "The graph has \(graph.edges.count) edges",
                      symbol: "point.topleft.down.curvedto.point.bottomright.up")
            .tabItem(){
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
    }
}

#Preview {
    GraphFacts(graph: cities)
}
