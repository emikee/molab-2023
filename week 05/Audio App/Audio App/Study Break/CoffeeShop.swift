import SwiftUI
import AVFoundation

struct Page1_Previews: PreviewProvider {
    static var previews: some View {
        var containerWidth:CGFloat = UIScreen.main.bounds.width - 32.0
        
        ScrollView{
            Grid(
                alignment: .leading,
                horizontalSpacing: 8,
                verticalSpacing: 8) {
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
                        Color.clear.gridCellUnsizedAxes([.horizontal, .vertical])
                    }
                    .frame(maxWidth: .infinity)
                
                }
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(ColorStyles.black)
        
    }
}
