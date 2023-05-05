//
//  Home.swift
//  Custom_CarouselSlider
//
//  Created by Sonic on 4/5/23.
//

import SwiftUI

var width = UIScreen.main.bounds.width

struct Home: View {
    @EnvironmentObject var viewModel: CarouselViewModel
    @Namespace var animation
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text("Healthy Tips")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                        .padding(.leading)
                    
                    
                    Spacer()
                }
                .padding()
                //Carousel
                ZStack {
                    ForEach(viewModel.cards.indices.reversed(), id: \.self) { index in
                        HStack {
                            CardView(card: viewModel.cards[index], animation: animation)
                                .frame(width: getCardWidth(at: index), height: getCardHeight(at: index))
                                .offset(x: getCardOffset(at: index))
                                .rotationEffect(.degrees(getCardRotation(at: index)))
                            
                            Spacer(minLength: 0)
                        }
                        .frame(height: 400)
                        .contentShape(Rectangle())
                        .offset(x: viewModel.cards[index].offset)
                        .gesture(
                            DragGesture(minimumDistance: 0)
                                .onChanged({ value in
                                    self.onChanged(value: value, at: index)
                                })
                                .onEnded( {
                                    self.onEnded(value: $0, at: index)
                                })
                        )
                    }
                }
                .padding(.top, 25)
                .padding(.horizontal, 30)
                
                Button {
                    resetViews()
                } label: {
                    Image(systemName: "arrow.left")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.blue)
                        .padding()
                        .background(Color.white)
                        .clipShape(Circle())
                        .shadow(radius: 3)
                }
                .padding(.top, 35)

                
                Spacer()
            }
            
            if viewModel.showCard {
                DetailView(animation: animation)
            }
        }
    }
    
    func resetViews() {
        for index in viewModel.cards.indices {
            withAnimation(.spring()) {
                viewModel.cards[index].offset = 0
                viewModel.swipedCard = 0
            }
        }
    }
    
    func getCardRotation(at index: Int) -> Double {
        let boxWidth = Double(width/3)
        let offset = Double(viewModel.cards[index].offset)
        let angle: Double = 5
        return (offset / boxWidth) * angle
    }
    
    func onChanged(value: DragGesture.Value, at index: Int) {
        if value.translation.width < 0 {
            viewModel.cards[index].offset = value.translation.width
        }
    }
    
    func onEnded(value: DragGesture.Value, at index: Int) {
        withAnimation {
            if -value.translation.width > width / 3 {
                viewModel.cards[index].offset = -width
                viewModel.swipedCard += 1
            } else {
                viewModel.cards[index].offset = 0
            }
        }
    }
    
    func getCardHeight(at index: Int) -> CGFloat {
        let height: CGFloat = 400
        let cardHeight = index-viewModel.swipedCard <= 2 ? CGFloat(index-viewModel.swipedCard) * 35 : 70
        return height - cardHeight
    }
    
    func getCardWidth(at index: Int) -> CGFloat {
        let boxWidth = UIScreen.main.bounds.width - 60 - 60
        //        let cardWidth = index <= 2 ? CGFloat(index) * 30 : 60
        return boxWidth
    }
    
    func getCardOffset(at index: Int) -> CGFloat {
        index-viewModel.swipedCard <= 2 ? CGFloat(index - viewModel.swipedCard) * 30 : 60
    }
}

struct Home_Preview: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
