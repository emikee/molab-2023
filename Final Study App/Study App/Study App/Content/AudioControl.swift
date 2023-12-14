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
        
        ScrollView {
            MusicRow(audio: musicfiles[0])
                .padding(.all, 16.0)
                .frame(maxWidth: .infinity)
            Spacer()
                .frame(height: 32)
            VStack (spacing: 24) {
                Text("Sounds")
                    .font(.headline)
                Grid(
                    alignment: .center,
                    horizontalSpacing: 8,
                    verticalSpacing: 24) {
                        GridRow {
                            AudioRow(audio: audiofiles[0])
                                .frame(width: containerWidth * 0.33)
                            AudioRow(audio: audiofiles[1])
                                .frame(width: containerWidth * 0.33)
                            AudioRow(audio: audiofiles[2])
                                .frame(width: containerWidth * 0.33)
                        }
                        .frame(maxWidth: .infinity)
                        GridRow {
                            AudioRow(audio: audiofiles[3])
                                .frame(width: containerWidth * 0.33)
                            AudioRow(audio: audiofiles[4])
                                .frame(width: containerWidth * 0.33)
                            AudioRow(audio: audiofiles[5])
                                .frame(width: containerWidth * 0.33)
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .padding(.horizontal, 16.0)
            }
            
        }
        .padding(.horizontal, 2.0)
        .padding(.vertical, 24.0)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct AudioControl_Previews: PreviewProvider {
    static var previews: some View {
        AudioControl()
    }
}
