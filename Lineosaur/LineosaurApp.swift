//
//  LineosaurApp.swift
//  Adjacency Table
//
//  Created by Dylan Conklin on 7/19/23.
//

import SwiftData
import SwiftUI
import TipKit

@main
internal struct LineosaurApp: App {
    internal var body: some Scene {
        WindowGroup {
            ContentView()
                .task {
                    try? Tips.configure([
                        .datastoreLocation(.applicationDefault),
                        .displayFrequency(.immediate)
                    ])
                }
        }
        .modelContainer(for: Graph.self)
    }
}
