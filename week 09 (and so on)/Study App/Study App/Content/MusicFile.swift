//
//  MusicFile.swift
//  Study App
//
//  Created by Emily Shen on 12/6/23.
//

import Foundation

var musicfiles = [
    MusicFile(name:"That Kyoto Vibe", url:"bgMusic.mp3", audioMax: 0.7),
    MusicFile(name: "Okinawa", url:"Okinawa.mp3", audioMax: 1)
]

struct MusicFile: Hashable, Codable {
    var name: String
    var url: String
    var audioMax: Float
}
