import SwiftUI
import AVFoundation

struct Page1_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            AudioRow(audio: audiofiles[0])
            AudioRow(audio: audiofiles[1])
            AudioRow(audio: audiofiles[2])
        }
    }
}
