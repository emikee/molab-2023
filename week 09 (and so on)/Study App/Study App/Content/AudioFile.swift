//
//  AudioFile.swift
//  Study App
//
//  Created by Emily Shen on 11/8/23.
//

import Foundation
import SwiftUI

var audiofiles = [
    AudioFile(name:"Background Track", url:"bgMusic.mp3", audioMax: 0.7),
    AudioFile(name:"Rain", url:"rain.mp3", audioMax: 2),
    AudioFile(name:"Chatter", url:"talking.mp3", audioMax: 7),
    AudioFile(name:"Espresso Machine", url:"espressoMachine.mp3", audioMax: 1),
    AudioFile(name:"Morning Birds", url:"morningBirds.mp3", audioMax: 3),
    AudioFile(name:"Fireplace", url:"fire.mp3", audioMax: 3),
    AudioFile(name:"Barista", url:"barista.mp3", audioMax: 2),
]

struct AudioFile: Hashable, Codable {
    var name: String
    var url: String
    var audioMax: Float
}
