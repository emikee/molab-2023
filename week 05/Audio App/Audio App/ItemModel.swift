//
//  Item.swift
//

import Foundation

struct ItemModel : Identifiable {
    let id = UUID()
    var urlStr:String = ""
    var title:String = ""
    var artist:String = ""
    var songUrl:String = ""
}

