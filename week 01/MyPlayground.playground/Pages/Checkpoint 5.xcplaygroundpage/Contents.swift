let luckyNumber = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

let solve = {(_: [Int]) in
    luckyNumber.filter { !$0.isMultiple(of: 2)}
        .sorted()
        .map{print("\($0) is a lucky number.")}
}

//func solving (_ : [Int]){
//    luckyNumber.filter {!$0.isMultiple(of: 2)}
//        .sorted()
//        .map{print("\($0) is a lucky number.")}
//}
solve(luckyNumber)
