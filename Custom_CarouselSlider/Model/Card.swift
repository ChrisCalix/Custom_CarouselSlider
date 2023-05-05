//
//  Card.swift
//  Custom_CarouselSlider
//
//  Created by Sonic on 4/5/23.
//

import SwiftUI

struct Card: Identifiable {
    var id = UUID().uuidString
    var cardColor: Color
    var offset: CGFloat = 0
    var title: String
}
