//
//  ContentView.swift
//  Executive Timer
//
//  Created by Кирилл Курочкин on 26.02.2024.
//

import SwiftUI
let defaultTime: CGFloat = 20 // время для таймера

struct TimerView: View {
    
    @State private var timerRunning = false //логическое значение работы таймера
    @State private var countdownTime: CGFloat = defaultTime
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            
            let countdownColor: Color = {
            switch (countdownTime) {
            case 6...: return Color.green
            case 3...: return Color.yellow
            default: return Color.red
            }
            }()
            let strokeStyle = StrokeStyle(lineWidth: 15, lineCap: .round)
            let buttonIcon = timerRunning ? "pause.rectangle.fill" : "play.rectangle.fill"
            Circle().stroke(Color.gray.opacity(0.2),style: strokeStyle)
            Circle()
                .trim(from: 0, to: 1 - ((defaultTime - countdownTime) / defaultTime))
                .stroke(countdownColor,style: strokeStyle)
                .rotationEffect(.degrees(-90))
                .animation(.easeInOut)
            HStack(spacing: 25) {
            Label("", systemImage: buttonIcon)
            .foregroundColor(.black).font(.title)
            .onTapGesture(perform: { timerRunning.toggle() })
            Text("\(Int(countdownTime))")
            .font(.largeTitle)
            Label("", systemImage: "gobackward")
            .foregroundColor(.red)
            .font(.title)
            .onTapGesture(perform: {
            timerRunning = false
            countdownTime = defaultTime
            })
            }
        }.frame(width: 300,height: 300)
            .onReceive(timer, perform: { _ in
                guard timerRunning else { return }
                if countdownTime > 0 {
                countdownTime -= 1
                } else {
                timerRunning = false
                countdownTime = defaultTime
                }
                })
        .padding()
    }
}



#Preview {
    TimerView()
}
