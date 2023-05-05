//
//  DetailView.swift
//  Custom_CarouselSlider
//
//  Created by Sonic on 4/5/23.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var viewModel: CarouselViewModel
    var animation: Namespace.ID
    
    var body: some View {
        ZStack {
            VStack {
                Text("Monday 29 december")
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.85))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .padding(.top, 10)
                    .matchedGeometryEffect(id: "date-\(viewModel.selectedCard.id)", in: animation)
                
                HStack {
                    Text(viewModel.selectedCard.title)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(width: 200, alignment: .leading)
                        .padding()
                        .matchedGeometryEffect(id: "title-\(viewModel.selectedCard.id)", in: animation)
                    
                    Spacer(minLength: 0)
                }
                
                if viewModel.showContent {
                    ScrollView {
                        Text(viewModel.content)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                        .padding()
                    }
                }
                
                Spacer(minLength: 0)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                viewModel.selectedCard.cardColor
                    .cornerRadius(25)
                    .matchedGeometryEffect(id: "bgColor-\(viewModel.selectedCard.id)", in: animation)
                    .ignoresSafeArea(.all, edges: .bottom)
            )
            
            VStack {
                Spacer()
                
                if viewModel.showContent {
                    Button (action: closeView) {
                        Image(systemName: "xmark")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(.blue)
                            .padding()
                            .background(Color.white.opacity(0.6))
                            .clipShape(Circle())
                            .padding(5)
                            .background(Color.white.opacity(0.7))
                            .clipShape(Circle())
                            .shadow(radius: 3)
                    }
                    .padding(.bottom)
                }
                
            }
        }
        
    }
    
    func closeView() {
        withAnimation(.spring()){
            viewModel.showCard.toggle()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                withAnimation(.easeOut) {
                    viewModel.showContent = false
                }
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
