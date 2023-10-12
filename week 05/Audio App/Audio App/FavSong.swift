//
// Audio bundled with app
// @State to track variables that affect UI
// TimelineView for timer triggered updates
// Keep audio short

import SwiftUI
import AVFoundation

struct Song {
    let title: String
    let artist: String
    let file: String
    let cover: String
}
let song1 = Song(title: "Okinawa", artist: "92914", file: "92914 - Okinawa (Audio).mp3", cover: "Okinawa")
let song2 = Song(title: "Redbone", artist: "Childish Gambino (Gyoshi Cover)", file: "Redbone - Childish Gambino (Guitar Cover) (1).mp3", cover: "Redbone")
let song3 = Song(title: "life hack", artist: "Vaundy (Gyoshi Cover)", file: "life hack Vaundy (Guitar cover).mp3", cover: "LifeHack")

let songInfo = [song1, song2, song3]
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
    @State private var soundFile = songInfo[0].file
    @State private var soundTitle = songInfo[0].title
    @State private var soundArtist = songInfo[0].artist
    @State private var soundCover = songInfo[0].cover
    @State private var player: AVAudioPlayer? = nil
    @State private var isRotating = 0.0
    var body: some View {
        ZStack {
            Color("DarkBG")
            Color("DarkBG").ignoresSafeArea()
            
            TimelineView(.animation) { context in
                VStack {
                    Text("MY COLLECTION")
                        .font(.title)
                        .padding(.all, 12.0)
                        .kerning(/*@START_MENU_TOKEN@*/6.0/*@END_MENU_TOKEN@*/)
                        .border(/*@START_MENU_TOKEN@*/Color.white/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                        .padding(/*@START_MENU_TOKEN@*/.bottom, 20.0/*@END_MENU_TOKEN@*/)
                        
                    ZStack {
                        Image("\(soundCover)")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 250, height: 250)
                            .clipShape(Circle())
                            .rotationEffect(.degrees(isRotating))
                            .onAppear{
                                withAnimation(.linear(duration: 1)
                                            .speed(0.1).repeatForever(autoreverses: false)) {
                                        isRotating = 360.0
                                    }
                            }
                        Circle()
                            .fill(Color(hue: 0.65, saturation: 0.151, brightness: 0.37))
                            .frame(width: 70, height: 70)
                        Circle()
                            .fill(Color.black)
                            .frame(width: 50, height: 50)
                    }
                    .padding(.bottom, 30.0)
                    
                    Text("SONG \(soundIndex + 1)")
                        .kerning(6.0)
                    Text("\(soundTitle)")
                        .font(.title)
                    Text("\(soundArtist)")
                        .foregroundColor(Color(hue: 1.0, saturation: 0.037, brightness: 0.734))
                        .padding(.bottom, 20.0)
//                    if let player = player {
//                        .brightness(20)
//                    }
                    
                    HStack {
                        Button {
                            print("Button Stop")
                            player?.stop()
                        } label: {
                            Image("Stop")
                                .resizable()
                                .frame(width: 48.0, height: 48.0)
                        }
                        Button{
                            print("Button Play")
                            player = loadFavSong(soundFile)
                            // Loop indefinitely
                            player?.numberOfLoops = -1
                            player?.play()
                        } label: {
                            Image("Play")
                                .resizable()
                                .frame(width: 48.0, height: 48.0)
                        }
                        Button{
                            soundIndex = (soundIndex+1) % songInfo.count
                            soundFile = songInfo[soundIndex].file;
                            soundTitle = songInfo[soundIndex].title;
                            soundArtist = songInfo[soundIndex].artist;
                            soundCover = songInfo[soundIndex].cover;
                        } label: {
                            Image("Skip")
                                .resizable()
                                .frame(width: 48.0, height: 48.0)
                        }
                    }
                    
                }
                .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

struct MySongs_Previews: PreviewProvider {
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
