//
//  TimerView.swift
//  Study App
//
//  Created by Emily Shen on 12/7/23.
//

import SwiftUI
import AVFAudio

var audioPlayer: AVAudioPlayer!
func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("ERROR")
        }
    }
}

struct TimerView: View {

    @State private var shadowColor: Color = ColorStyles.d_purple
    @State private var shadowRadius: CGFloat = 10
    @State private var shadowX: CGFloat = 10
    @State private var shadowY: CGFloat = 10
    @State var stateManager = PomodoroModel()
    @State private var timeRemaining: TimeInterval = 10
    @State private var initialTime: Double = 10
    @State private var timer: Timer?
    @State private var isRunning: Bool = false
    @State private var longBreak: Int = 0
    let times = ["Test", "25 : 5", "45 : 15", "60 : 25"]
    @State private var timeSelect = "Test"
    @State private var selectedTime: Double = 0
    
    
    var titleIcon: String {
        switch stateManager.focusState {
        case .focus:
                return "moon.fill"
        case .rest:
            return "moon.zzz.fill"
        }
    }
    var title: String {
        switch stateManager.focusState {
            
        case .focus:
            return "Focus"
        
        case .rest:
            return "Break"
        }
    }
    var body: some View {
        GeometryReader{proxy in
            VStack{
                ZStack {
                    HStack (spacing: 8) {
                        Image(systemName: titleIcon)
                        Text(title)
                            .font(.headline)
                            .frame(alignment: .center)
                    }
                    HStack {
                        Text("\(timeSelect)")
                            .foregroundColor(ColorStyles.text.opacity(0.5))
                            .textCase(.uppercase)
                            .offset(x: 24)
                        Spacer()
                        Text("Done \(longBreak)")
                            .foregroundColor(ColorStyles.text.opacity(0.5))
                            .textCase(.uppercase)
                            .offset(x: -16)
                    }
                    
                }
                Menu {
                    Picker(selection: $timeSelect) {
                        ForEach(times, id: \.self) {
                            Text($0)
                                .foregroundColor(ColorStyles.text)
                        }
                    } label: {}
                } label: {
                    HStack (spacing: 8){
                        Image(systemName: "timer")
                        Text("Change Time")
                    }
                    .foregroundColor(ColorStyles.text)
                    .font(.headline)
                    
                }
                .padding(.all)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(ColorStyles.text.opacity(0.5), lineWidth: 1)
                )
                .offset(y: 24)
                
                ZStack{
                    Button {
                        isRunning.toggle()
                        if isRunning {
                            startTimer()
                        } else {
                            stopTimer()
                        }
                    } label:  {
                        ZStack{
                            if isRunning {
                                VStack {
                                    Text(formattedTime())
                                        .font(.title)
                                        .frame(height: 32)
                                    Image(systemName: "pause.fill")
                                        .resizable()
                                        .frame(width: 14.0, height: 14.0)
                                        .opacity(0.8)
                                }
                                .offset(y: 8)
                                .foregroundColor(ColorStyles.white)
                            } else {
                                VStack {
                                    Image(systemName: "play.fill")
                                        .resizable()
                                        .frame(width: 24.0, height: 28.0)
                                    Text(formattedTime())
                                        .opacity(0.8)
                                        .font(.headline)
                                }
                                .offset(y: 8)
                                .foregroundColor(ColorStyles.white)
                            }
                        }
                        .frame(width: 136, height: 136)
                        .background(ColorStyles.purple)
                        .clipShape(Circle())
                        .foregroundColor(ColorStyles.white)
                        
                    }
                    
                    Circle()
                        .stroke(Color("DiscBg"), lineWidth: 48)
                        .shadow(color: shadowColor, radius: shadowRadius, x: shadowX, y: shadowY)
                        .onAppear() {
                            withAnimation(.linear(duration: 3).repeatForever()) {
                                shadowColor = ColorStyles.d_blue
                                shadowRadius = 10
                                shadowX = -10
                                shadowY = -5
                            }
                    }
                        .padding(64)
                        .frame(height: proxy.size.width)
                    Circle()
                        .trim(from: 0, to: CGFloat(1-(timeRemaining/initialTime)))
                        .stroke(style: StrokeStyle(lineWidth: 8, lineCap: .round))
                        .rotationEffect(.init(degrees: -90))
                        .foregroundColor(Color("Primary"))
                        .blendMode(.colorDodge)
                        .padding(38)
                        .animation(.easeInOut, value: CGFloat(1-(timeRemaining/initialTime)))
                        
                    Circle()
                        .trim(from: 0, to: CGFloat(1-(timeRemaining/initialTime)))
                        .stroke(style: StrokeStyle(lineWidth: 8, lineCap: .round))
                        .rotationEffect(.init(degrees: -90))
                        .foregroundColor(Color("Primary"))
                        .padding(38)
                        .blur(radius: 2)
                        .animation(.easeInOut, value: CGFloat(1-(timeRemaining/initialTime)))
                    Image("Rod")
                        .offset(x: 96, y: 0)
                }
//                .onTapGesture {
//                    pomodoroModel.gesture = 0.5
//                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                .offset(y: -32)
            }
        }
        .preferredColorScheme(stateManager.focusState == .rest ? .light : .dark)
    }
    private func formattedTime() -> String {
        let minutes = Int(timeRemaining)/60
        let second = Int(timeRemaining) % 60
        return String(format: "%02d:%02d", minutes, second)
    }

    private func startTimer() {
        if stateManager.focusState == .focus {
            if timeSelect == "25 : 5" {
                selectedTime = 1500
            }
            else if timeSelect == "45 : 15" {
                selectedTime = 2700
            }
            else if timeSelect == "60 : 5" {
                selectedTime = 3600
            }
            else {
                selectedTime = 10
            }
            timeRemaining = selectedTime
            initialTime = selectedTime
        } else {
            if timeSelect == "25 : 5" {
                selectedTime = 300
            }
            else if timeSelect == "45 : 15" {
                selectedTime = 900
            }
            else if timeSelect == "60 : 25" {
                selectedTime = 1500
            }
            else {
                selectedTime = 5
            }
            timeRemaining = selectedTime
            initialTime = selectedTime
        }
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {_ in
            if timeRemaining > 0 {
                timeRemaining -= 1
                if timeRemaining == 0 {
                    //toggle state
                    if stateManager.focusState == .focus {
                        
                        if longBreak == 0 {
                            longBreak += 1
                        }
                        else if longBreak % 4 == 0 {
                            longBreak += 1
                            stopTimer()
                            timeRemaining = 8
                            initialTime = 8
                        }
                        else {
                            longBreak += 1
                        }
                            
                        stateManager.focusState = .rest
                        
                    } else {
                        stateManager.focusState = .focus
                    }
                }
            } else {
                stopTimer()
            }
        }
    }
    private func stopTimer() {
        isRunning = false
        timer?.invalidate()
        if stateManager.focusState == .focus {
            if timeSelect == "25 : 5" {
                selectedTime = 1500
            }
            else if timeSelect == "45 : 15" {
                selectedTime = 2700
            }
            else if timeSelect == "60 : 5" {
                selectedTime = 3600
            }
            else {
                selectedTime = 10
            }
            timeRemaining = selectedTime
            initialTime = selectedTime
        } else {
            if timeSelect == "25 : 5" {
                selectedTime = 300
            }
            else if timeSelect == "45 : 15" {
                selectedTime = 900
            }
            else if timeSelect == "60 : 25" {
                selectedTime = 1500
            }
            else {
                selectedTime = 5
            }
            timeRemaining = selectedTime
            initialTime = selectedTime
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}

//code referenced: https://www.youtube.com/watch?v=zIht_qDoSsM
//would like to play ding on end
