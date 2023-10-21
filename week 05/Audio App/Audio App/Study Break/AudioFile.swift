//
//  AudioFile.swift
//  Audio App
//
//  Created by Emily Shen on 10/21/23.
//

import Foundation
import SwiftUI

var audiofiles = [AudioFile(id:1, name:"Relaxing beats", url:"That Kyoto Vibe.mp3"), AudioFile(id:2, name:"Rain", url:"rain.mp3"), AudioFile(id:3, name:"People", url:"talking.mp3")]

struct AudioFile: Hashable, Codable {
    var id: Int
    var name: String
    var url: String
}

