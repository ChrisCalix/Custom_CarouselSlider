//
//  CardView.swift
//  Custom_CarouselSlider
//
//  Created by Sonic on 4/5/23.
//

import SwiftUI

struct CardView: View {
    @EnvironmentObject var viewModel: CarouselViewModel
    var card: Card
    var animation: Namespace.ID
    
    var body: some View {
        
        VStack {
            Text("Monday 29 december")
                .font(.caption)
                .foregroundColor(.white.opacity(0.85))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.top, 10)
                .matchedGeometryEffect(id: "date-\(card.id)", in: animation)
            
            HStack {
                Text(card.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(width: 200, alignment: .leading)
                    .padding()
                    .matchedGeometryEffect(id: "title-\(card.id)", in: animation)
                
                Spacer(minLength: 0)
            }
            Spacer(minLength: 0)
            
            HStack {
                Spacer(minLength: 0)
                
                if !viewModel.showContent {
                    Text("Read More")
                    
                    Image(systemName: "arrow.right")
                }
            }
            .foregroundColor(.white)
            .padding(32)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            card.cardColor
                .cornerRadius(25)
                .matchedGeometryEffect(id: "bgColor-\(card.id)", in: animation)
        )
        .onTapGesture {
            withAnimation(.spring()){
                viewModel.selectedCard = card
                viewModel.showCard.toggle()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    withAnimation(.easeIn) {
                        viewModel.showContent = true
                    }
                }
            }
        }
        
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
