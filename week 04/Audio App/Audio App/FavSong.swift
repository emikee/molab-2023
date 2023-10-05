//
// Audio bundled with app
// @State to track variables that affect UI
// TimelineView for timer triggered updates
// Keep audio short

import SwiftUI
import AVFoundation

let favSong = [
    "92914 - Okinawa (Audio).mp3",
    "Redbone - Childish Gambino (Guitar Cover) (1).mp3",
    "life hack Vaundy (Guitar cover).mp3"
];

// Create a Audio Player given a file stored in the app bundle
// Detailed documntation on AVAudioPlayer
//  https://developer.apple.com/documentation/avfaudio/avaudioplayer

func loadFavSong(_ fileName:String) -> AVAudioPlayer? {
    let path = Bundle.main.path(forResource: fileName, ofType:nil)!
    let url = URL(fileURLWithPath: path)
    do {
        return try AVAudioPlayer(contentsOf: url)
    } catch {
        print("loadBundleAudio error", error)
    }
    return nil
}

struct PlayFavSong: View {
    @State private var soundIndex = 0
    @State private var soundFile = favSong[0]
    @State private var player: AVAudioPlayer? = nil
    var body: some View {
        TimelineView(.animation) { context in
            VStack {
                HStack {
                    Button{
                        print("Button Play")
                        player = loadFavSong(soundFile)
                        print("player", player as Any)
                        // Loop indefinitely
                        player?.numberOfLoops = -1
                        player?.play()
                    } label: {
                        Image("Play")
                    }
                    Button("Stop") {
                        print("Button Stop")
                        player?.stop()
                    }
                    Button("Next") {
                        soundIndex = (soundIndex+1) % favSong.count
                        soundFile = favSong[soundIndex];
                    }
                }
                Text("soundIndex \(soundIndex)")
                Text("soundFile \(soundFile)")
                if let player = player {
                    Text("duration " + String(format: "%.1f", player.duration))
                    Text("currentTime " + String(format: "%.1f", player.currentTime))
                }
            }
        }
    }
}

struct Page1_Previews: PreviewProvider {
    static var previews: some View {
        PlayFavSong()
    }
}

// https://developer.apple.com/documentation/avfaudio/avaudioplayer

// https://developer.apple.com/documentation/swiftui/state

// Source for audio clips
// https://www.youraccompanist.com/free-scales-and-warm-ups/reference-scales
// Reference Scales_On A Flat-G Sharp.mp3
// https://sound-effects.bbcrewind.co.uk/search?cat=Animals
// https://file-examples.com/index.php/sample-audio-files/sample-mp3-download/
