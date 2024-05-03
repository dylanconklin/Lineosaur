//
//  CloseButtonView.swift
//  Lineosaur
//
//  Created by Dylan Conklin on 3/18/24.
//

import SwiftUI

internal struct CloseButtonView<Content: View>: View {
    @State internal var title: String?
    @State internal var titleStyle: NavigationBarItem.TitleDisplayMode?
    @ViewBuilder internal var content: () -> Content
    @Environment(\.dismiss)
    private var dismiss: DismissAction

    internal var body: some View {
        NavigationStack {
            content()
                .navigationTitle(title ?? "")
                .navigationBarTitleDisplayMode(titleStyle ?? .automatic)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                .toolbar {
                    Button("Dismiss", systemImage: "xmark.circle.fill") {
                        dismiss()
                    }
                    .foregroundStyle(.primary)
                    .frame(maxWidth: .infinity, alignment: .topTrailing)
                }
        }
    }
}

#Preview {
    CloseButtonView(title: "Preview") {
        Spacer()
    }
}
