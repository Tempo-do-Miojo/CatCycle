//
//  FrameSets.swift
//  CatCycle
//
//  Created by PATRICIA S SIQUEIRA on 20/05/21.
//


import SwiftUI

class FrameSets: ObservableObject {
    @Published var cycleX: CGFloat
    @Published var cycleY: CGFloat
    init(cycleX: CGFloat, cycleY: CGFloat) {
        self.cycleX = cycleX
        self.cycleY = cycleY
    }
}
