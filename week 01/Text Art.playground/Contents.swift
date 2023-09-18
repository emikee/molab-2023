import UIKit


for i in 1...9 {
    var dot = String(repeating: "*", count: i)
    var plus = String(repeating: "+", count: i)
    var percent = String(repeating: "%", count: i)
    print("\(dot)   \(plus)   \(percent)   ")
}
//going in reverse
for i in stride(from: 8, to: 0, by: -1) {
    var dot = String(repeating: "*", count: i)
    var plus = String(repeating: "+", count: i)
    var percent = String(repeating: "%", count: i)
    print("\(dot)   \(plus)   \(percent)   ")
}


//errors: tried using the stride function to let the for loop run in reverse but there is no output at all. I used: for i in stride(from: 0, to: 8, by: -1); the problem was that I had to change the range from 8 to 0 rather than having it the other way around.
