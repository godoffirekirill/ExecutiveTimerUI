//
//  ContentView.swift
//  Executive Timer
//
//  Created by Кирилл Курочкин on 26.02.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            TimerView()
            .padding()
            .tabItem {
            Image(systemName: "timer")
            Text("Timer")
            }
            .tag(1)
            TimerSettingsView()
                .padding()
                .tabItem {
                Image(systemName: "gear")
                Text("Setting")
                }
                .tag("Timer")
        }
    }
}

