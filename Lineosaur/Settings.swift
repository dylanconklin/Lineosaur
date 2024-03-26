//
//  Settings.swift
//  Lineosaur
//
//  Created by Dylan Conklin on 9/30/23.
//

import SwiftUI

struct Settings: View {
    @AppStorage("deleteDetachedVertices") var deleteDetachedVertices: Bool = false

    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    Text("Made with ❤️ in Portland, OR")
                    Text("MIT License")
                }
                .font(.callout)
                .padding()

                Link("Check out my other projects", destination: URL(string: "https://dylanconklin.github.io")!)
                    .navigationTitle("About")
            }
        }
    }
}

#Preview {
    Settings()
}
