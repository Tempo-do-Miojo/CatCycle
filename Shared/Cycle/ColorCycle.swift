//
//  ColorCycle.swift
//  CatCycleWatch Extension
//
//  Created by PATRICIA S SIQUEIRA on 18/05/21.
//

import SwiftUI

class ColorSets: ObservableObject {
    @Published var color1: Color
    @Published var color2: Color
    @Published var color3: Color
    @Published var color4: Color
    init(color1: Color, color2: Color, color3: Color, color4: Color) {
        self.color1 = color1
        self.color2 = color2
        self.color3 = color3
        self.color4 = color4
    }
}
