//
//  ContentView.swift
//  Adjacency Table
//
//  Created by Dylan Conklin on 7/19/23.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    var g = G()

    var body: some View {
        NavigationView {
            List {
                Section ("Builder") {
                    NavigationLink("Build Table") {
                        TableBuilder(g: g)
                            .navigationTitle("Table Builder")
                    }
                }
                Section ("Viewers") {
                    NavigationLink("View Given Table") {
                        TableView(MST: g.G)
                            .navigationTitle("Given Tree")
                    }
                    NavigationLink("View Minimum Spanning Tree") {
                        TableView(MST: g.MST)
                            .navigationTitle("Min. Spanning Tree")
                    }
                }
            }
            .navigationTitle("Adjacency Table")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
