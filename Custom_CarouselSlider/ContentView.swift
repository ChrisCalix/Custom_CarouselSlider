//
//  ContentView.swift
//  Custom_CarouselSlider
//
//  Created by Sonic on 4/5/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var homeModel = CarouselViewModel()
    
    var body: some View {
        Home()
            .environmentObject(homeModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
