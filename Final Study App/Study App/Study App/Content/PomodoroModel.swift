//
//  pomodoroModel.swift
//  Study App
//
//  Created by Emily Shen on 12/8/23.
//

import SwiftUI

enum FocusState {
    case focus
    case rest
}
class PomodoroModel: NSObject, ObservableObject {
    @Published public var focusState: FocusState = .focus
//    @Published var progress: CGFloat = 1
//    @Published var timerStringValue: String = "0:00"   
//    @Published var hour: Int = 0
//    @Published var minutes: Int = 0
//    @Published var seconds: Int = 0
}
