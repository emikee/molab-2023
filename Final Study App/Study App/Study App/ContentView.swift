//
//  ContentView.swift
//  Study App
//
//  Created by Emily Shen on 11/8/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            ScrollView(.vertical){
                VStack (spacing: 0) {
                    TimerView()
                        .frame(height: 600)
                    AudioControl()
                        .offset(y: -24)
                        
                }
                .frame(maxHeight: .infinity)
                


                }
            }
        //.ignoresSafeArea()
        .background(ColorStyles.bgColor)
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
