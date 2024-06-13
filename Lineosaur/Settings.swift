//
//  Settings.swift
//  Lineosaur
//
//  Created by Dylan Conklin on 9/30/23.
//

import SwiftUI

struct Settings: View {
    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    Text("Made with ❤️ in Portland, OR")
                    Text("MIT License")
                }
                .font(.callout)
                .padding()

                if let url: URL = .init(string: "https://dylanconklin.github.io") {
                    Link("Check out my other projects", destination: url)
                        .navigationTitle("About")
                }
            }
        }
    }
}

#Preview {
    Settings()
}
