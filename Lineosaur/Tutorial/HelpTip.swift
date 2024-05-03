//
//  HelpTip.swift
//  Lineosaur
//
//  Created by Dylan Conklin on 3/25/24.
//

import SwiftUI
import TipKit

internal struct HelpTip: Tip {
    internal var title: Text { Text("Need Help?") }
    internal var message: Text? { Text("Tap here for help if you need a refresher") }
    internal var image: Image? { Image(systemName: "graduationcap.fill") }
}
