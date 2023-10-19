//
//  Document.swift
//  Audio App
//
//  Created by Emily Shen on 10/18/23.
//

import Foundation
// Array of image url strings
let imageArray = [
    "https://images.genius.com/c84c747c7266eb5b14019ef4b5111027.1000x1000x1.jpg",
    "https://m.media-amazon.com/images/M/MV5BZTQzZmU3ZjQtOTUxMS00MGYwLWJlOGItMTUwZmExNDQ1ZTA2XkEyXkFqcGdeQXVyMjQxNzM0MjI@._V1_FMjpg_UX1000_.jpg",
    "https://images.genius.com/e53c7150f935ba2e1596d00a6092522c.1000x1000x1.jpg"
]

class Document: ObservableObject {
    @Published var items:[ItemModel]
    init() {
        print("Model init")
        // items for testing
        items = [
            ItemModel(urlStr: imageArray[0], title:"Okinawa", artist: "92914", songUrl: "https://www.youtube.com/watch?v=KzHOPckFmwc"),
            ItemModel(urlStr: imageArray[1], title:"Childish Gambino (Guitar)", artist: "Gyoshi", songUrl: "https://www.youtube.com/watch?v=EVL4zoKHw5I"),
            ItemModel(urlStr: imageArray[2], title:"lifehack", artist: "Vaundy", songUrl: "https://www.youtube.com/watch?v=Tzyt91TYjLA"),
        ]
    }
    
    func addItem(urlStr:String, title:String, artist:String, songUrl: String) -> ItemModel {
        let item = ItemModel(urlStr:urlStr, title:title, artist: artist, songUrl: songUrl)
        items.append(item)
        return item
    }
    
    func newItem() -> ItemModel {
        return addItem(urlStr: "", title: "", artist: "", songUrl: "")
    }
    
    func updateItem(id: UUID, urlStr:String, title:String, artist:String, songUrl: String) {
        if let index = findIndex(id) {
            items[index].urlStr = urlStr
            items[index].title = title
            items[index].artist = artist
            items[index].songUrl = songUrl
        }
    }
    
    func deleteItem(id: UUID) {
        if let index = findIndex(id) {
            items.remove(at: index)
        }
    }
    
    func findIndex(_ id: UUID) -> Int? {
        return items.firstIndex { item in item.id == id }
    }
}
