import UIKit

enum boundary: Error {
    case outOfBounds, noSqRt
}

func checkBoundary(number: Int) throws -> String{
    
    for i in 1...100 {
        if number > 10_000 || number < 1 {
            throw boundary.outOfBounds
        }
        if number == i*i {
            return "\(i) is the square root of \(number)"
        } else {
            continue
        }
    }
    throw boundary.noSqRt
}

do {
    let result = try checkBoundary(number: 15)
    print(result)
    } catch boundary.outOfBounds {
        print("Number is out of bounds")
    } catch boundary.noSqRt {
        print("there is no square root to this number")
    }

