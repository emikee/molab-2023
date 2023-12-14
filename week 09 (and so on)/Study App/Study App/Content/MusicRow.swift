//
//  MusicRow.swift
//  Study App
//
//  Created by Emily Shen on 12/6/23.
//

import Foundation
import SwiftUI
import AVFoundation
import MediaPlayer
import UIKit

func loadMusic(_ fileName:String) -> AVAudioPlayer? {
    let path = Bundle.main.path(forResource: fileName, ofType:nil)!
    let url = URL(fileURLWithPath: path)
    do {
        return try AVAudioPlayer(contentsOf: url)
    } catch {
        print("loadSound error", error)
    }
    return nil
}

struct MusicRow: View {
    var audio: MusicFile
    @State private var player: AVAudioPlayer? = nil
    @State private var volume: Float = 0
    private var normalFillColor: Color { ColorStyles.text.opacity(0.5) }
    private var emptyColor: Color { ColorStyles.text.opacity(0.2) }
    private var paragraph: Color {ColorStyles.text.opacity(0.7)}
    @State private var playerDuration: TimeInterval = 100
    private let maxDuration = TimeInterval(240)
    @State private var musicIndex = 0
    @State private var musicName = musicfiles[0].name
    @State private var musicUrl = musicfiles[0].url
    
    var body: some View {
        VStack (spacing: 24){
            HStack {
                Button{
                    musicIndex = (musicIndex+1) % musicfiles.count
                    musicName = musicfiles[musicIndex].name
                    musicUrl = musicfiles[musicIndex].url
                    player = loadSound(musicUrl)
                    player?.numberOfLoops = -1
                    player?.volume = volume
                    player?.play()
                } label: {
                    Image(systemName: "backward.fill")
                }
                Spacer()
                Text(musicName)
                    .font(.headline)
                    .fontWeight(.medium)
                    .foregroundColor(paragraph)
                Spacer()
                Button{
                    musicIndex = (musicIndex+1) % musicfiles.count
                    musicName = musicfiles[musicIndex].name
                    musicUrl = musicfiles[musicIndex].url
                    player = loadSound(musicUrl)
                    player?.numberOfLoops = -1
                    player?.volume = volume
                    player?.play()
                    
                } label: {
                    Image(systemName: "forward.fill")
                }
                
            }
            .foregroundColor(ColorStyles.text)
 
            LongVolumeSlider(
                value: $volume,
                inRange: 0...audio.audioMax,
                activeFillColor: ColorStyles.text,
                fillColor: normalFillColor,
                emptyColor: emptyColor,
                height: 8,
                onEditingChanged: {change in
                    //player = loadSound(audio.url)
                    player?.volume = volume
                    if (volume > 0) {
                        player?.play()
                        print("played \(musicUrl) + \(player?.volume ?? 0)")
                    } else {
                        player?.pause()
                        print("paused \(musicUrl)")
                    }
                })
            .frame(width: 300)
            .onAppear() {
                player = loadSound(musicUrl)
                player?.numberOfLoops = -1
                player?.volume = 0
            }
            
        }
        .frame(width: 300)
        
    }
    
    struct MusicRow_Previews: PreviewProvider {
        static var previews: some View {
            MusicRow(audio: musicfiles[0])
        }
    }
}
