import SwiftUI
import AVFoundation

struct AudioComponent {
    let audioName: String
    let file: String
}
let bgMusic = AudioComponent(audioName: "Background music", file: "That Kyoto Vibe.mp3")
let rainSound = AudioComponent(audioName: "Rain", file: "1 MINUTE Relaxing rain sound rain.mp3")

func loadBundleAudio(_ fileName:String) -> AVAudioPlayer? {
    let path = Bundle.main.path(forResource: fileName, ofType:nil)!
    let url = URL(fileURLWithPath: path)
    do {
        return try AVAudioPlayer(contentsOf: url)
    } catch {
        print("loadBundleAudio error", error)
    }
    return nil
}

struct PlayCoffeeShop: View {
    @State private var soundIndex = 0
    //    @State private var soundFile = bundleAudio[0]
    @State private var player: AVAudioPlayer? = nil
    @State private var playCount = 0
    var body: some View {
        TimelineView(.animation) { context in
            VStack {
                HStack {
                    Button {
                        print("Button Stop")
                        player?.pause()
                    } label: {
                        Image("Stop")
                            .resizable()
                            .frame(width: 32.0, height: 32.0)
                    }
                    Button{
                        print("Button Play")
                        player = loadBundleAudio(bgMusic.file)
                        // Loop indefinitely
                        player?.numberOfLoops = -1
                        player?.play()
                    } label: {
                        Image("Play")
                            .resizable()
                            .frame(width: 32.0, height: 32.0)
                    }
                    Text("\(bgMusic.audioName)")
                }
                HStack {
                    Button {
                        print("Button Stop")
                        player?.stop()
                    } label: {
                        Image("Stop")
                            .resizable()
                            .frame(width: 32.0, height: 32.0)
                    }
                    Button{
                        print("Button Play")
                        player = loadBundleAudio(rainSound.file)
                        // Loop indefinitely
                        player?.numberOfLoops = -1
                        player?.play()
                    } label: {
                        Image("Play")
                            .resizable()
                            .frame(width: 32.0, height: 32.0)
                    }
                    Text("\(rainSound.audioName)")
                }
            }
        }
    }
    
    struct Page2_Previews: PreviewProvider {
        static var previews: some View {
            PlayCoffeeShop()
        }
    }
}
