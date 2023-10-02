//
//  Settings.swift
//  Adjacency Table Builder
//
//  Created by Dylan Conklin on 9/30/23.
//

import SwiftUI

struct Settings: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink {
                    VStack {
                        Text("Developed by Dylan Conklin")
                            .padding()
                        Text("MIT License")
                            .padding()
                        Text("Made with ❤️ in Portland, OR")
                            .padding()
                    }
                } label: {
                    Label("About GraphApp", systemImage: "info")
                }
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    Settings()
}
