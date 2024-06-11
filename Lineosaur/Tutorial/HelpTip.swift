//
//  HelpTip.swift
//  Lineosaur
//
//  Created by Dylan Conklin on 3/25/24.
//

import SwiftUI
import TipKit

struct HelpTip: Tip {
    var title: Text { Text("Need Help?") }
    var message: Text? { Text("Tap here for help if you need a refresher") }
    var image: Image? { Image(systemName: "graduationcap.fill") }
}
