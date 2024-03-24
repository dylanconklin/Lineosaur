//
//  Settings.swift
//  Lineosaur
//
//  Created by Dylan Conklin on 9/30/23.
//

import SwiftUI

struct Settings: View {
    @AppStorage("displayEdgeWeights") var displayEdgeWeights: Bool = false
    @AppStorage("deleteDetachedVertices") var deleteDetachedVertices: Bool = false

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Toggle("Show Edge Weights", isOn: $displayEdgeWeights)

#warning("Unimplemented: Delete Detatched Vertices")
                    Toggle("Delete Detached Vertices", isOn: $deleteDetachedVertices)

                    NavigationLink {
                        GraphSelector()
                    } label: {
                        Label("Open Graph", systemImage: "folder")
                    }
                } footer: {
                    VStack {
                        Text("Made with ❤️ in Portland, OR")
                        Text("MIT License")
                    }
                    .font(.callout)
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                }
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    Settings()
}
