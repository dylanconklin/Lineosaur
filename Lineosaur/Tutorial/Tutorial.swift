//
//  Tutorial.swift
//  Lineosaur
//
//  Created by Dylan Conklin on 2/25/24.
//

import SwiftUI
import TipKit

struct TutorialTip: Tip {
    var title: Text { Text("Need Help?") }
    var message: Text? { Text("Learn the basic features of Lineosaur, and how to use it") }
    var image: Image? { Image(systemName: "graduationcap.fill") }
    var actions: [Tip.Action] {
        [
            Tips.Action(title: "Open Tutorial") {}
        ]
    }
}

struct TutorialDatum: Codable, Identifiable {
    private enum CodingKeys: String, CodingKey { case systemImage, accessibilityLabel, bodyText }

    var systemImage: String
    var accessibilityLabel: String
    var bodyText: String
    var id: UUID = .init()
}

struct Tutorial: View {
    static var symbolSize: CGFloat = 32
    let tutorialData: [TutorialDatum] = Bundle.main.decode("TutorialData.json")

    var body: some View {
        VStack {
            CloseButtonView {
                VStack {
                    Text("Thank you for downloading Lineosaur!")
                        .multilineTextAlignment(.center)
                        .font(.title)
                    List(tutorialData) { item in
                        tutorialCell(for: item)
                    }
                }
            }
        }
    }

    func tutorialCell(for item: TutorialDatum) -> some View {
        HStack {
            Image(systemName: item.systemImage)
                .accessibilityLabel(item.accessibilityLabel)
                .font(.system(size: Self.symbolSize))
            Text(item.bodyText)
                .padding(.horizontal)
        }
    }
}

#Preview {
    Tutorial()
}
