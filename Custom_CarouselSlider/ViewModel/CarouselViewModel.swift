//
//  CarouselViewModel.swift
//  Custom_CarouselSlider
//
//  Created by Sonic on 4/5/23.
//

import SwiftUI

class CarouselViewModel: ObservableObject {
    
    @Published var cards: [Card] = [
        .init(cardColor: Color.blue, title: "Neurobics for your mind"),
        .init(cardColor: Color.purple, title: "Brush up on hygine"),
        .init(cardColor: Color.green, title: "Don't skip breakfast."),
        .init(cardColor: Color.yellow, title: "Brush up on hygine."),
        .init(cardColor: Color.orange, title: "Neurobics for your mind"),
    ]
    
    @Published var swipedCard = 0
    
    @Published var showCard = false
    @Published var selectedCard = Card(cardColor: .clear, title: "")
    
    @Published var showContent = false
    
    var content = "Humans have long used cognitive enhancement methods to expand the proficiency and range of the various mental activities that they engage in, including writing to store and retrieve informtaion, and computers that allow them to perform myriad activities that are now commonplace in the internet age. Neuroenhancement describes the use of neuroscience-based techniques for enhancing cognitive function by acting directly on the human brain and nervous system, altering its properties to increase performance. Cognitive neuroscience has now reached the point where it may begin to put theory derived from years of experimentation into practice. This special issue includes 16 articles that employ or examine a variety of neuroenhancement methods currently being developed to increase cognition in healthy people and in patients with neurological or phychiatric illness."
}
