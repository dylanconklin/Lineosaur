//
//  GraphEditorTips.swift
//  Adjacency Table Builder
//
//  Created by Dylan Conklin on 11/22/23.
//

import TipKit

struct AddElementTip: Tip {
    var title: Text {
        Text("Add Elements")
    }

    var message: Text? {
        Text("Tap on + to add edges and vertices to your graph")
    }

    var image: Image? {
        Image(systemName: "point.topleft.down.curvedto.point.bottomright.up")
    }
}
