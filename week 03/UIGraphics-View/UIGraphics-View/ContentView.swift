import SwiftUI
import UIKit

struct ContentView: View {
    var body: some View {
        let _ = Self._printChanges()
        VStack {
            imageMaze
            Text("Week 03")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.black)
        }
        .padding()
    }
    
    var imageMaze: some View {
        Image(uiImage: renderImg(300, 300))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


func renderImg(_ width:Int, _ height:Int) -> UIImage {
    print("renderMaze width=\(width) height=\(height)")
    let len = width / 4;
    let hi = height;
    let sz = CGSize(width: width, height: height)
    let renderer = UIGraphicsImageRenderer(size: sz)
    let image = renderer.image { context in
        let ctx = context.cgContext
        var y = 0.0
        var x = 0.0
        let box = renderer.format.bounds
        let lineLen = 1/12.0
        let strokeLen = 1/20.0
        let xlen = box.width * lineLen
        let ylen = box.height * lineLen
        ctx.setStrokeColor(UIColor.blue.cgColor)
        while y < box.height {
            if Bool.random() {
                ctx.move(to: CGPoint(x: x, y: y))
                ctx.addLine(to: CGPoint(x: x+xlen, y: y+ylen))
            } else {
                ctx.move(to: CGPoint(x: x+xlen, y: y))
                ctx.addLine(to: CGPoint(x: x, y: y+ylen))
            }
            ctx.drawPath(using: .fillStroke)
            x += xlen
            if x > box.width {
                x = 0
                y += ylen
            }
        }
        UIColor.blue.setFill()
//        var randInt = Int.random(in: 1...4)
//        var randPos = Int.random(in: 1...6)
//        for _ in 0...4 {
//            context.fill(CGRect(x: len/randPos, y: hi/randPos, width: len*randInt, height: hi/randInt))
//        }
        
        //how can i put this in a loop?
        context.fill(CGRect(x: 0, y: 0, width: len, height: hi/4))
        context.fill(CGRect(x: len*2, y: 0, width: len, height: hi/4))
        context.fill(CGRect(x: len, y: hi/4, width: len, height: hi/4))
        context.fill(CGRect(x: len*3, y: hi/4, width: len, height: hi/4))
        context.fill(CGRect(x: 0, y: hi/2, width: len, height: hi/4))
        context.fill(CGRect(x: len*2, y: hi/2, width: len, height: hi/4))
        context.fill(CGRect(x: len, y: hi-(hi/4), width: len, height: hi/4))
        context.fill(CGRect(x: len*3, y: hi-(hi/4), width: len, height: hi/4))
    }
    return image;
}
