import Foundation
import SwiftUI
import AVFoundation
import MediaPlayer
import UIKit

func loadSound(_ fileName:String) -> AVAudioPlayer? {
    let path = Bundle.main.path(forResource: fileName, ofType:nil)!
    let url = URL(fileURLWithPath: path)
    do {
        return try AVAudioPlayer(contentsOf: url)
    } catch {
        print("loadSound error", error)
    }
    return nil
}

struct AudioRow: View {
    var audio: AudioFile
    @State private var player: AVAudioPlayer? = nil

    var body: some View {
        HStack {
            Text(audio.name)
            Spacer()
            HStack {
                VolumeSlider()
                   .frame(height: 40)
                   .padding(.horizontal)
                Button("Play") {
                    print("Button Play")
                    player = loadSound(audio.url)
                    print("player", player as Any)
                    // Loop indefinitely
                    player?.numberOfLoops = -1
                    player?.play()
                }
                Button("Stop") {
                    print("Button Stop")
                    player?.stop()
                }
            }
        }
        .padding()
    }
}


struct Audio_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            AudioRow(audio: audiofiles[0])
            AudioRow(audio: audiofiles[1])
            AudioRow(audio: audiofiles[2])
        }
    }
}
