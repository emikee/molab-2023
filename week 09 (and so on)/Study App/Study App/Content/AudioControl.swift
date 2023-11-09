//
//  AudioControl.swift
//  Study App
//
//  Created by Emily Shen on 11/8/23.
//

import SwiftUI

struct AudioControl: View {
    var body: some View {
        
        let containerWidth:CGFloat = UIScreen.main.bounds.width - 32.0
        
        ScrollView{
            Grid(
                alignment: .leading,
                horizontalSpacing: 8,
                verticalSpacing: 32) {
                    GridRow {
                        AudioRow(audio: audiofiles[0])
                            .frame(width: containerWidth * 0.50)
                        AudioRow(audio: audiofiles[1])
                            .frame(width: containerWidth * 0.50)
                    }
                    .frame(maxWidth: .infinity)
                    GridRow {
                        AudioRow(audio: audiofiles[2])
                            .frame(width: containerWidth * 0.50)
                        AudioRow(audio: audiofiles[3])
                            .frame(width: containerWidth * 0.50)
                    }
                    .frame(maxWidth: .infinity)
                    GridRow {
                        AudioRow(audio: audiofiles[4])
                            .frame(width: containerWidth * 0.50)
                        AudioRow(audio: audiofiles[5])
                            .frame(width: containerWidth * 0.50)
                    }
                    .frame(maxWidth: .infinity)
                    GridRow {
                        AudioRow(audio: audiofiles[6])
                            .frame(width: containerWidth * 0.50)
                    }
                    .frame(maxWidth: .infinity)
                
                }
        }
        .padding(.horizontal, 2.0)
        .padding(.vertical, 24.0)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(ColorStyles.black)
    }
}

struct AudioControl_Previews: PreviewProvider {
    static var previews: some View {
        AudioControl()
    }
}
