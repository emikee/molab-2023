//
//  TimerView.swift
//  Study App
//
//  Created by Emily Shen on 12/7/23.
//

import SwiftUI

struct TimerView: View {
    @State private var shadowColor: Color = .green
    @State private var shadowRadius: CGFloat = 8
    @State private var shadowX: CGFloat = 20
    @State private var shadowY: CGFloat = 0
    var body: some View {
            VStack {
                Circle()
                    .stroke(ColorStyles.black, lineWidth: 36)

                    .frame(width: 200, height: 200)
                    .shadow(color: shadowColor, radius: shadowRadius, x: shadowX, y: shadowY)
                    .onAppear() {
                        withAnimation(.linear(duration: 2.5).repeatForever()) {
                            shadowColor = .blue
                            shadowRadius = 2
                            shadowX = -5
                            shadowY = 5
                        }
                    }
            }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
